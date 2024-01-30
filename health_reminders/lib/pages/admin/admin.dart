import 'package:flutter/material.dart';
import 'package:health_reminders/pages/admin/exercise_admin.dart';
import 'package:health_reminders/pages/admin/food_admin.dart';
import 'package:health_reminders/pages/admin/news_admin.dart';
import 'package:health_reminders/styles/CustomAppBar.dart';
import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';

class adminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
          title: "ADMIN"),
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
                              print('go to foodadmin');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => food_adminPage()),
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //Icon(Icons.female, color: brown,),
                                Text(
                                  'อาหาร',
                                  style: TextStyles.login,
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
                              print('go to exerciseadmin ');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => exercise_adminPage()),
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //Icon(Icons.female, color: brown,),
                                Text(
                                  'ออกกำลังกาย',
                                  style: TextStyles.login,
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
                              print('go to newsadmin');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => news_adminPage()),
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //Icon(Icons.female, color: brown,),
                                Text(
                                  'ข่าวสารสุขภาพ',
                                  style: TextStyles.login,
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
