import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_reminders/pages/lanrelog/signInScreen.dart';
import 'package:health_reminders/pages/lanrelog/signUpScreen.dart';
import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';
import 'package:page_transition/page_transition.dart';

class landingPage extends StatefulWidget {
  @override
  State<landingPage> createState() => _landingPageState();
}

class _landingPageState extends State<landingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 190,
              ),
              Text(
                'ยินดีต้อนรับ',
                style: TextStyle(
                    color: Color.fromRGBO(107, 89, 24, 1),
                    fontFamily: 'Garuda',
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: buttonone,
                onPressed: () {
                  // Handle the first button press
                  print('Button 1 Pressed');
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: signInScreen(),
                    ),
                  );
                },
                child: Text(
                  'เข้าสู่ระบบ',
                  style: TextStyles.login,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: buttontwo,
                onPressed: () {
                  // Handle the second button press
                  print('Button 2 Pressed');
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: signUpScreen(),
                    ),
                  );
                },
                child: Text(
                  'สมัครสมาชิก',
                  style: TextStyles.login,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
