import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_reminders/controller/operator.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';
import 'package:page_transition/page_transition.dart';

class NavigationPlugin {
  static void goToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.rightToLeft,
        child: page,
      ),
    );
  }
}

class SessionManagerPlugin {
  static bool isLoggedIn = false;
}

class showDataPlugin extends StatelessWidget {
  final String docId;
  const showDataPlugin({required this.docId});

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

            return Container(
              child: Column(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: healthData != null &&
                                  healthData.containsKey('image_flie')
                              ? null
                              : Colors
                                  .yellow, // กำหนดสีพื้นหลังเป็นสีเหลืองเมื่อไม่มีรูป
                          backgroundImage: healthData != null &&
                                  healthData.containsKey('image_flie')
                              ? NetworkImage(healthData['image_flie'])
                              : null, // กำหนดรูปภาพเมื่อมีข้อมูล
                          radius: 50,
                        ),
                        SizedBox(width: 50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                '${usersData != null ? usersData['username'] : 'ไม่มีข้อมูล'}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),

                            Row(
                              children: [
                                Text(
                                  'อายุ: ${healthData != null ? healthData['age'] : 'ไม่มีข้อมูล'}',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(width: 20),
                                Text(
                                  'เพศ: ${healthData != null ? (healthData['gender'] == 'M' ? 'ชาย' : 'หญิง') : 'ไม่มีข้อมูล'}',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            // เพิ่มข้อมูลอื่น ๆ ตามต้องการ
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('น้ำหนัก', style: TextStyles.Thome),
                                Text(
                                    '${healthData != null ? healthData['weight'] : 'ไม่มีข้อมูล'}',
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('ส่วนสูง', style: TextStyles.Thome),
                                Text(
                                    '${healthData != null ? healthData['height'] : 'ไม่มีข้อมูล'}',
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
                                  color: gg,
                                  // blurRadius:5.0,
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('BMI', style: TextStyles.Thome),
                                Text('22.09', style: TextStyles.Thome1),
                                Text('ปกติ', style: TextStyles.Thome),
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
          },
        );
      },
    );
  }
}
