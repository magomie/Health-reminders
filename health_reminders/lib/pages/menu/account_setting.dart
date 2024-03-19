import 'package:flutter/material.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';

class account_settingPage extends StatefulWidget {
  const account_settingPage({super.key});

  @override
  State<account_settingPage> createState() => _account_settingPageState();
}

class _account_settingPageState extends State<account_settingPage> {
  /*void initState() {
    NotificationProvider.checkReminders((widget.userId));
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: white,
              centerTitle: true,
              title: Text(
                'ข้อมูลบัญชี',
                style: TextStyle(
                  color: Colors
                      .brown, // Assuming 'brown' is a defined color variable
                  fontFamily: 'Garuda',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'ชื่อ',
                    style: TextStyles.common,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
