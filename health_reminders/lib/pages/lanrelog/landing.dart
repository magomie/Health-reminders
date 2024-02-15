import 'package:flutter/material.dart';
import 'package:health_reminders/pages/lanrelog/login.dart';
import 'package:health_reminders/pages/lanrelog/signUpScreen.dart';
import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';
import 'package:page_transition/page_transition.dart';

class landingPage extends StatelessWidget {
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
                      child: loginPage(),
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
