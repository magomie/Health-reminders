import 'dart:async';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';
import 'package:timezone/timezone.dart' as tz;

class userPlugin {
  static int createUniqueId() {
    int other = 100; // กำหนดค่า other
    int uniqueId = DateTime.now().microsecond.remainder(other);
    return uniqueId;
  }

  static FutureOr<String> generateId(String collection, String label) async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection(collection).get();

    List<String> existingUserIds =
        querySnapshot.docs.map((doc) => doc.id).toList();

    int IdNumber = 1;
    String newId;
    do {
      newId = '${label}_id_$IdNumber';
      IdNumber++;
    } while (existingUserIds
        .contains(newId)); // ตรวจสอบว่า user_id ใหม่ซ้ำกับที่มีอยู่หรือไม่

    return newId;
  }

  static FutureOr<String> generateNotiId(String userId) async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');

    QuerySnapshot querySnapshot =
        await users.doc(userId).collection('Notification').get();

    List<String> existingUserIds =
        querySnapshot.docs.map((doc) => doc.id).toList();

    int userIdNumber = 1;
    String newUserId;
    do {
      newUserId = 'noti_id_$userIdNumber';
      userIdNumber++;
    } while (existingUserIds
        .contains(newUserId)); // ตรวจสอบว่า user_id ใหม่ซ้ำกับที่มีอยู่หรือไม่

    return newUserId;
  }
}

class NotificationProvider extends ChangeNotifier {
  NotificationProvider(String userId) {
    // Start periodic check for reminders
    _startPeriodicCheck(userId);
  }

  void _startPeriodicCheck(String userId) {
    // Set the duration for periodic check (e.g., every 1 hour)
    const Duration checkInterval = Duration(microseconds: 1);

    // Start periodic timer
    Timer.periodic(checkInterval, (timer) {
      // Perform reminders check
      checkReminders(userId); // Replace userId with actual user ID
    });
  }

  static Future<void> checkReminders(String userId) async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');

    QuerySnapshot querySnapshot =
        await users.doc(userId).collection('Notification').get();

    for (DocumentSnapshot notiDoc in querySnapshot.docs) {
      DateTime notiDate = notiDoc['selectDate'].toDate();
      TimeOfDay notiTime =
          TimeOfDay.fromDateTime(notiDoc['selectTime'].toDate());

      DateTime notiDateTime = DateTime(notiDate.year, notiDate.month,
          notiDate.day, notiTime.hour, notiTime.minute);

      if (notiDateTime.isAfter(DateTime.now())) {
        await _scheduleNotification(
            notiDateTime, notiDoc['title'], notiDoc['note']);
      } else {
        await _sendLocalNotification(notiDoc['title'], notiDoc['note']);
      }
    }
  }

  static Future<void> _scheduleNotification(
      DateTime dateTimeSchedule, String title, String note) async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    var androidPlatformChannelSpecifics =
        AndroidNotificationDetails('your channel id', 'your channel name');
    /*var iOSPlatformChannelSpecifics = IOSNotificationDetails(); // iOS specific notification settings*/
    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      // Use zonedSchedule instead of schedule
      0,
      title,
      note,
      tz.TZDateTime.from(dateTimeSchedule,
          tz.local), // Convert DateTime to timezone-aware DateTime
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static Future<void> _sendLocalNotification(String title, String note) async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your channel id',
      'your channel name',
    );
    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      note,
      platformChannelSpecifics,
      payload: 'item x',
    );
  }
}

class SessionManagerPlugin {
  static bool isLoggedIn = false;
}

class showDataPlugin extends StatelessWidget {
  final String docId;
  final Widget Function(
      BuildContext context, dynamic usersData, dynamic healthData) otherClass;

  const showDataPlugin({required this.docId, required this.otherClass});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection('users').doc(docId).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('เกิดข้อผิดพลาด: ${snapshot.error}');
        }

        var usersData = snapshot.data!.data();

        return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(docId)
              .collection('health_data')
              .doc(docId)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('เกิดข้อผิดพลาด: ${snapshot.error}');
            }

            if (!snapshot.hasData || snapshot.data == null) {
              return Text('ไม่พบข้อมูล');
            }

            var healthData = snapshot.data!.data();

            return otherClass(context, usersData, healthData);
          },
        );
      },
    );
  }
}

class showDataHealthPlugin extends StatelessWidget {
  final String docId;
  final Widget Function(BuildContext context, dynamic healthData) otherClass;
  const showDataHealthPlugin({required this.docId, required this.otherClass});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(docId)
          .collection('health_data')
          .doc(docId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('เกิดข้อผิดพลาด: ${snapshot.error}');
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return Text('ไม่พบข้อมูล');
        }

        var healthData = snapshot.data!.data();

        return otherClass(context, healthData);
      },
    );
  }
}

class showNewsPlugin extends StatelessWidget {
  final Widget Function(BuildContext context, dynamic newsData) otherClass;
  const showNewsPlugin({required this.otherClass});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('news').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('เกิดข้อผิดพลาด: ${snapshot.error}');
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Text('ไม่พบข้อมูล');
        }

        List<DocumentSnapshot> newsDocuments = snapshot.data!.docs;
        return ListView.builder(
          itemCount: newsDocuments.length,
          itemBuilder: (context, index) {
            dynamic newsData = newsDocuments[index].data();
            return otherClass(context, newsData);
          },
        );
      },
    );
  }
}

class homeProfileWidget extends StatelessWidget {
  final dynamic usersDataSet;
  final dynamic healthDataSet;

  homeProfileWidget({required this.usersDataSet, required this.healthDataSet});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 255, 112, 67),
              offset: const Offset(0, 0),
              //blurRadius: 20,
              //spreadRadius: -5,
            ),
          ],
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color.fromARGB(255, 253, 248, 236),
                Color.fromARGB(255, 249, 242, 227),
                Color.fromARGB(255, 244, 233, 206),
                Color.fromARGB(255, 244, 233, 206),
              ],
              stops: const [
                0.1,
                0.3,
                0.9,
                1.0
              ])),
      child: Column(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: CircleAvatar(
                    backgroundColor: healthDataSet != null &&
                            healthDataSet.containsKey('image_flie')
                        ? null
                        : yellow, // กำหนดสีพื้นหลังเป็นสีเหลืองเมื่อไม่มีรูป
                    backgroundImage: healthDataSet != null &&
                            healthDataSet.containsKey('image_flie')
                        ? NetworkImage(healthDataSet['image_flie'])
                        : null, // กำหนดรูปภาพเมื่อมีข้อมูล
                    radius: 50,
                  ),
                ),
                SizedBox(width: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        '${usersDataSet != null ? usersDataSet['username'] : 'ไม่มีข้อมูล'}',
                        style: TextStyles.common,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          'อายุ: ${healthDataSet != null ? '${healthDataSet['age']}  ปี' : 'ไม่มีข้อมูล'}',
                          style: TextStyles.common,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'เพศ: ${healthDataSet != null ? (healthDataSet['gender'] == 'M' ? 'ชาย' : 'หญิง') : 'ไม่มีข้อมูล'}',
                          style: TextStyles.common,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),

          //menu bmi
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    width: 330, // Set the desired height
                    decoration: BoxDecoration(
                      //border: Border.all(color: brown, width: 1.0),
                      boxShadow: [
                        BoxShadow(
                          color: bb,
                          // blurRadius:5.0,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('น้ำหนัก', style: TextStyles.Thome),
                        Text(
                            '${healthDataSet != null ? healthDataSet['weight'] : 'ไม่มีข้อมูล'}',
                            style: TextStyles.Thome1),
                        Text('กก.', style: TextStyles.Thome),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    height: 80,
                    width: 330, // Set the desired height
                    decoration: BoxDecoration(
                      //border: Border.all(color: brown, width: 1.0),
                      boxShadow: [
                        BoxShadow(
                          color: bb,
                          // blurRadius:5.0,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('ส่วนสูง', style: TextStyles.Thome),
                        Text(
                            '${healthDataSet != null ? healthDataSet['height'] : 'ไม่มีข้อมูล'}',
                            style: TextStyles.Thome1),
                        Text('ซม.', style: TextStyles.Thome),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    height: 80,
                    width: 330, // Set the desired height
                    decoration: BoxDecoration(
                      //border: Border.all(color: brown, width: 1.0),
                      boxShadow: [
                        BoxShadow(
                          color: calBMI(healthDataSet['weight'],
                                          healthDataSet['height']) <
                                      18.50 ||
                                  calBMI(healthDataSet['weight'],
                                          healthDataSet['height']) >=
                                      30.00
                              ? Colors.red
                              : (calBMI(healthDataSet['weight'],
                                              healthDataSet['height']) >=
                                          18.50 &&
                                      calBMI(healthDataSet['weight'],
                                              healthDataSet['height']) <=
                                          22.90
                                  ? gg
                                  : (calBMI(healthDataSet['weight'],
                                                  healthDataSet['height']) >=
                                              23.00 &&
                                          calBMI(healthDataSet['weight'],
                                                  healthDataSet['height']) <=
                                              29.90
                                      ? yellow
                                      : yellow)),
                          // blurRadius:5.0,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('BMI', style: TextStyles.Thome),
                        Text(
                            '${calBMI(healthDataSet['weight'], healthDataSet['height'])}',
                            style: TextStyles.Thome),
                        Text(
                            getBMIString(calBMI(healthDataSet['weight'],
                                healthDataSet['height'])),
                            style: TextStyles.Thome),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // แสดงข้อมูลอื่น ๆ ตามต้องการ
        ],
      ),
    );
  }
}

class wathercalWidget extends StatelessWidget {
  final dynamic healthDataSet;

  wathercalWidget({required this.healthDataSet});

  @override
  Widget build(BuildContext context) {
    double boxSizeWidth = 345;
    return Container(
      child: Column(
        children: [
          Container(
            height: 70,
            width: boxSizeWidth,
            decoration: BoxDecoration(
              border: Border.all(color: brown, width: 1.0),
              boxShadow: [
                BoxShadow(
                  color: noti,
                  //blurRadius: 5.0,
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            //height: 60,

            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 5),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('ปริมาณน้ำที่ควรได้รับต่อวัน',
                          style: TextStyles.common),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${calWater(healthDataSet['weight'])}',
                        style:
                            TextStyles.common2, // You can customize the style
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'มิลลิลิตร',
                        style: TextStyles.common, // You can customize the style
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class newsWidget extends StatelessWidget {
  final dynamic newsDataSet;

  newsWidget({required this.newsDataSet});

  @override
  Widget build(BuildContext context) {
    double boxSizeWidth = 345;
    return SafeArea(
      child: Expanded(
        child: ListView.builder(
          itemCount: newsDataSet.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> newsData = newsDataSet[index].data();
            return Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: noti,
                    //blurRadius: 5.0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      newsData['image_url'],
                      width: 110,
                      height: 110,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 0.0,
                      bottom: 0.0,
                      left: 15.0,
                      right: 0.0,
                    ),
                    child: Container(
                      width: 210.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            newsData['title'],
                            style: TextStyles.Tlogin,
                          ),
                          Text(
                            newsData['content'],
                            style: TextStyles.common2,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('อ่านเพิ่มเติม'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 3.0,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class profileWidget extends StatelessWidget {
  final dynamic usersDataSet;
  final dynamic healthDataSet;

  profileWidget({required this.usersDataSet, required this.healthDataSet});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 64,
                backgroundColor: healthDataSet != null &&
                        healthDataSet.containsKey('image_flie')
                    ? null
                    : Colors.yellow, // กำหนดสีพื้นหลังเป็นสีเหลืองเมื่อไม่มีรูป
                backgroundImage: healthDataSet != null &&
                        healthDataSet.containsKey('image_flie')
                    ? NetworkImage(healthDataSet['image_flie'])
                    : null, // กำหนดรูปภาพเมื่อมีข้อมูล
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                'ข้อมูลส่วนตัว',
                style: TextStyles.Tlogin,
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          _buildInfoRow(
            'ชื่อ',
            '${usersDataSet != null ? usersDataSet['username'] : 'ไม่มีข้อมูล'}',
          ),
          _buildInfoRow('อายุ',
              '${healthDataSet != null ? '${healthDataSet['age']} ปี' : 'ไม่มีข้อมูล'}'),
          _buildInfoRow(
            'เพศ',
            '${healthDataSet != null ? (healthDataSet['gender'] == 'M' ? 'ชาย' : 'หญิง') : 'ไม่มีข้อมูล'}',
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                'ข้อมูลสุขภาพ',
                style: TextStyles.Tlogin,
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          _buildHealthInfoRow('น้ำหนัก',
              '${healthDataSet != null ? '${healthDataSet['weight']} กิโลกรัม' : 'ไม่มีข้อมูล'}'),
          _buildHealthInfoRow('ส่วนสูง',
              '${healthDataSet != null ? '${healthDataSet['height']} เซนติเมตร' : 'ไม่มีข้อมูล'}'),
          _buildHealthInfoRow(
            'BMI   ',
            '${calBMI(healthDataSet['weight'], healthDataSet['height']) < 18.50 ? '${calBMI(healthDataSet['weight'], healthDataSet['height'])}   ผอม' : '${calBMI(healthDataSet['weight'], healthDataSet['height']) >= 18.50 && calBMI(healthDataSet['weight'], healthDataSet['height']) <= 22.90 ? '${calBMI(healthDataSet['weight'], healthDataSet['height'])}   ปกติ' : '${calBMI(healthDataSet['weight'], healthDataSet['height']) >= 23.00 && calBMI(healthDataSet['weight'], healthDataSet['height']) <= 24.90 ? '${calBMI(healthDataSet['weight'], healthDataSet['height'])}   ท้วม' : '${calBMI(healthDataSet['weight'], healthDataSet['height']) >= 25.00 && calBMI(healthDataSet['weight'], healthDataSet['height']) <= 29.90 ? '${calBMI(healthDataSet['weight'], healthDataSet['height'])}   อ้วน' : '${calBMI(healthDataSet['weight'], healthDataSet['height']) >= 30.00 ? '${calBMI(healthDataSet['weight'], healthDataSet['height'])}   อ้วนมาก' : 'ไม่มีข้อมูล'}'}'}'}'}',
          ),
          _buildHealthInfoRow('BMR  ',
              '${healthDataSet != null ? '${healthDataSet['height']} เซนติเมตร' : 'ไม่มีข้อมูล'}'),
        ],
      ),
    );
  }
}

Widget _buildInfoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.only(left: 35, top: 10),
    child: Row(
      children: [
        Text(
          label,
          style: TextStyles.Tlogin,
        ),
        SizedBox(
          width: 50, // ปรับขนาดตามความต้องการ
        ),
        Text(
          value,
          style: TextStyles.common5,
        ),
      ],
    ),
  );
}

Widget _buildHealthInfoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.only(left: 35, top: 10),
    child: Row(
      children: [
        Column(
          children: [
            Text(
              label,
              style: TextStyles.Tlogin,
            ),
          ],
        ),
        SizedBox(
          width: 60, // ปรับขนาดตามความต้องการ
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              value,
              style: TextStyles.common5,
            ),
          ],
        ),
      ],
    ),
  );
}

class DateButtom extends StatelessWidget {
  final String title;
  final String text;
  final VoidCallback onClicked;
  DateButtom(
      {required this.title, required this.text, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        fixedSize: MaterialStateProperty.all<Size>(Size(100, 46)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: brown), // เปลี่ยนสีขอบของปุ่ม
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all<Color>(white), // เปลี่ยนสีพื้นหลังของปุ่ม
      ),
      onPressed: onClicked,
      child: FittedBox(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.brown,
            fontSize: 16,
            fontFamily: 'Garuda',
          ),
        ),
      ),
    );
  }
}

double calBMI(double w, double h) {
  double bmi = w / ((h / 100) * (h / 100));
  return double.parse(bmi.toStringAsFixed(2));
}

String getBMIString(double bmi) {
  return '${bmi < 18.50 ? 'ผอม' : '${bmi >= 18.50 && bmi <= 22.90 ? 'ปกติ' : '${bmi >= 23.00 && bmi <= 24.90 ? 'ท้วม' : '${bmi >= 25.00 && bmi <= 29.90 ? 'อ้วน' : '${bmi >= 30.00 ? 'อ้วนมาก' : 'ไม่มีข้อมูล'}'}'}'}'}';
}

double calWater(double w) {
  print(w);
  double water = (w / 2) * (2.2) * (30);
  return double.parse(water.toStringAsFixed(2));
}
