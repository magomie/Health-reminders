import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:health_reminders/controller/endpoin.dart';
import 'package:health_reminders/model/mode.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';

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

  static FutureOr<String> generateFoodId() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('foods').get();

    List<String> existingFoodIds =
        querySnapshot.docs.map((doc) => doc.id).toList();

    int idNumber = 1;
    String newId;
    do {
      newId = 'food_id_$idNumber';
      idNumber++;
    } while (existingFoodIds.contains(newId));

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
          _buildHealthInfoRow(
              'BMR  ',
              '${healthDataSet != null ? '${calBMR(
                  healthDataSet['weight'],
                  healthDataSet['height'],
                  healthDataSet['gender'],
                  healthDataSet['age'],
                  healthDataSet['exerciseLevel'],
                )} กิโลแคลอรี่' : 'ไม่มีข้อมูล'}'),
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

double calBMR(double w, double h, String gender, int age, int exerciseLevel) {
  double tempBMR, BMR;
  if (gender == 'M') {
    tempBMR = (66 + (13.7 * w) + (5 * h) - (6.8 * age));
    BMR = bmrExercise(tempBMR, exerciseLevel);
    return double.parse(BMR.toStringAsFixed(2));
  } else if (gender == 'F') {
    tempBMR = (665 + (9.6 * w) + (1.8 * h) - (4.7 * age));
    BMR = bmrExercise(tempBMR, exerciseLevel);
    return double.parse(BMR.toStringAsFixed(2));
  } else {
    return 0;
  }
}

double bmrExercise(double bmr, int exerciseLevel) {
  double bmrDiv;
  if (exerciseLevel == 1) {
    bmrDiv = bmr * 1.2;
    return double.parse(bmrDiv.toStringAsFixed(2));
  } else if (exerciseLevel == 2) {
    bmrDiv = bmr * 1.2;
    return double.parse(bmrDiv.toStringAsFixed(2));
  } else if (exerciseLevel == 3) {
    bmrDiv = bmr * 1.2;
    return double.parse(bmrDiv.toStringAsFixed(2));
  } else if (exerciseLevel == 4) {
    bmrDiv = bmr * 1.2;
    return double.parse(bmrDiv.toStringAsFixed(2));
  } else if (exerciseLevel == 5) {
    bmrDiv = bmr * 1.2;
    return double.parse(bmrDiv.toStringAsFixed(2));
  } else {
    return 0;
  }
}

String getBMIString(double bmi) {
  return '${bmi < 18.50 ? 'ผอม' : '${bmi >= 18.50 && bmi <= 22.90 ? 'ปกติ' : '${bmi >= 23.00 && bmi <= 24.90 ? 'ท้วม' : '${bmi >= 25.00 && bmi <= 29.90 ? 'อ้วน' : '${bmi >= 30.00 ? 'อ้วนมาก' : 'ไม่มีข้อมูล'}'}'}'}'}';
}

double calWater(double w) {
  print(w);
  double water = (w / 2) * (2.2) * (30);
  return double.parse(water.toStringAsFixed(2));
}

class NotificationServices {
  static Future<void> InitializaNotification() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelKey: 'ex',
            channelName: 'ex',
            channelDescription: 'เวลาออกกำลังกาย',
            defaultColor: yellow,
            locked: true,
            enableLights: true,
            playSound: true),
        NotificationChannel(
            channelKey: 'water_reminder',
            channelName: 'water_reminder',
            channelDescription: 'เวลาทานน้ำ',
            defaultColor: yellow,
            locked: true,
            enableLights: true,
            playSound: true),
      ],
    );

    scheduleWaterNotifications();
  }

  static Future<void> scheduleWaterNotifications() async {
    Random rd = Random();
    final int max = 1000000;

    Timer? time;
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: rd.nextInt(max) + 1,
        channelKey: 'water_reminder',
        title: 'เวลาทานน้ำ',
        body: 'เวลาทานน้ำแล้ว! โปรดดื่มน้ำให้เพียงพอ',
        category: NotificationCategory.Message,
        notificationLayout: NotificationLayout.BigText,
        locked: true,
        autoDismissible: false,
        fullScreenIntent: true,
        backgroundColor: yellow,
      ),
      schedule: NotificationInterval(
        interval: 2,
        allowWhileIdle: true,
        repeats: true,
      ),
    );
  }

  static Future<void> scheduleNotification(
      {required NotiModel noti, required String userId}) async {
    Random rd = Random();
    final int max = 1000000;
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: rd.nextInt(max) + 1,
        channelKey: 'ex',
        title: noti.title,
        body: noti.note,
        category: NotificationCategory.Alarm,
        notificationLayout: NotificationLayout.BigText,
        locked: true,
        autoDismissible: false,
        fullScreenIntent: true,
        backgroundColor: yellow,
      ),
      schedule: NotificationCalendar(
        minute: noti.selectedTime.minute,
        hour: noti.selectedTime.hour,
        day: noti.selectedDate.day,
        month: noti.selectedDate.month,
        year: noti.selectedDate.year,
        preciseAlarm: true,
        allowWhileIdle: true,
        timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'close',
          label: 'ปิดการแจ้งเตือน',
          autoDismissible: true,
        )
      ],
    );

    // คำนวณเวลาที่ต้องรอจนกว่าจะถึงเวลาที่ตั้งการแจ้งเตือน
    DateTime notificationTime = DateTime(
      noti.selectedDate.year,
      noti.selectedDate.month,
      noti.selectedDate.day,
      noti.selectedTime.hour,
      noti.selectedTime.minute,
    );

    // คำนวณเวลาที่เหลือจนกว่าจะถึงเวลาที่ต้องการแจ้งเตือน
    Duration timeUntilNotification =
        notificationTime.difference(DateTime.now());

    // รอจนกว่าจะถึงเวลาที่ตั้งการแจ้งเตือน
    Timer(
      timeUntilNotification,
      () async {
        // เมื่อถึงเวลาที่ตั้งการแจ้งเตือนเอาไว้ จะทำการเรียก API เพื่ออัปเดตสถานะการแจ้งเตือน
        await APIEndpoint.updateNotificationStatus(
            userId, noti.notiId, 'scheduled');
      },
    );
  }
}

class BuildNotificationListView extends StatelessWidget {
  final String userId;
  final String label;

  BuildNotificationListView({required this.userId, required this.label});

  @override
  Widget build(BuildContext context) {
    final List<String> _buttonEdit = [
      'edit',
      'delete',
    ];

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('Notification')
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

        var notifications = snapshot.data!.docs;

        return Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              var notification =
                  notifications[index].data() as Map<String, dynamic>;
              if (notification != null &&
                  notification['notiStatus'] == 'active' &&
                  notification['notiStatusLabel'] == label) {
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 10.0,
                    left: 10.0,
                  ),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: ListTile(
                      title: Text(notification['title'] ?? ''),
                      subtitle: Text(notification['note'] ?? ''),
                      trailing: PopupMenuButton(
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              value: 'edit',
                              child: Text('Edit'),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Text('Delete'),
                            )
                          ];
                        },
                        onSelected: (String value) {
                          print('You Click on po up menu item');
                        },
                      ),
                    ),
                  ),
                );
              } else {
                return Container(); // ถ้าสถานะไม่ใช่ active ให้ไม่แสดงรายการ
              }
            },
          ),
        );
      },
    );
  }
}

class BuildFoodListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('food').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('เกิดข้อผิดพลาด: ${snapshot.error}');
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return Text('ไม่พบข้อมูล');
        }

        var fooddata = snapshot.data!.docs;

        return Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: fooddata.length,
            itemBuilder: (context, index) {
              var foodList = fooddata[index].data() as Map<String, dynamic>;
              if (foodList != null) {
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 10.0,
                    left: 10.0,
                  ),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: FutureBuilder<String>(
                          future: FirebaseStorage.instance
                              .ref('images/${foodList['image_file']}')
                              .getDownloadURL(),
                          builder: (BuildContext context,
                              AsyncSnapshot<String> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot.hasData) {
                                return Image.network(
                                  snapshot.data!,
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                );
                              } else {
                                return Icon(Icons
                                    .error); // แสดงไอคอนเมื่อเกิดข้อผิดพลาด
                              }
                            } else {
                              return CircularProgressIndicator(); // แสดง indicator ขณะโหลดรูปภาพ
                            }
                          },
                        ),
                      ),
                      title: Text(foodList['name_food'] ?? ''),
                      subtitle: Text('แก้ด้วยนะ'),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.add_circle_outline,
                          color: brown,
                        ),
                        onPressed: () {
                          /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => notidrug2Page()),
                    );*/
                        },
                      ),
                    ),
                  ),
                );
              } else {
                return Container(); // ถ้าสถานะไม่ใช่ active ให้ไม่แสดงรายการ
              }
            },
          ),
        );
      },
    );
  }
}
