import 'package:flutter/material.dart';
import 'package:health_reminders/pages/notification/addNotiDoctorScreen.dart';
import 'package:health_reminders/pages/notification/showNotiDoctorScreen.dart';
import 'package:health_reminders/pages/notification/showNotiDrugScreen.dart';
import 'package:health_reminders/pages/notification/showNotiExerciseScreen.dart';
import 'package:health_reminders/pages/notification/showNotiSleepScreen.dart';
import 'package:health_reminders/styles/CustomAppBar.dart';

import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';

class notificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
          title: "การแจ้งเตือน"),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        height: 60,
                        child: ElevatedButton(
                            style: buttonnoti,
                            onPressed: () {
                              // Handle the first button press
                              print('Button 1 Pressed');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        showNotiExerciseScreen()),
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'asset/image/exercise.png',
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'เวลาออกกำลังกาย',
                                  style: TextStyles.head,
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        height: 60,
                        child: ElevatedButton(
                            style: buttonnoti,
                            onPressed: () {
                              // Handle the first button press
                              print('go to drug notification');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => showNotiDrugScreen()),
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'asset/image/icondrug.png',
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'เวลารับประทานยา',
                                  style: TextStyles.head,
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        height: 60,
                        child: ElevatedButton(
                            style: buttonnoti,
                            onPressed: () {
                              // Handle the first button press
                              print('go to doctor notification');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        showNotiDoctorScreen()),
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'asset/image/doctor.png',
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'เวลานัดพบแพทย์',
                                  style: TextStyles.head,
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Container(
                        height: 60,
                        child: ElevatedButton(
                            style: buttonnoti,
                            onPressed: () {
                              print('go to sleepy notification');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        showNotiSleepScreen()),
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'asset/image/sleep.png',
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'เวลานอน',
                                  style: TextStyles.head,
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
