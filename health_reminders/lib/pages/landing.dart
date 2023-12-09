import 'package:flutter/material.dart';
import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/text.dart';

class landingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
      
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 190,),
              Text('ยินดีต้อนรับ', style: TextStyle(
          color: Color.fromRGBO(107, 89, 24, 1),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.bold,
          fontSize: 24),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                style: buttonone,
                onPressed: () {
                  // Handle the first button press
                  print('Button 1 Pressed');
                },
                child: Text('เข้าสู่ระบบ',style: TextStyles.login,),
              ),


              SizedBox(height: 10),
              ElevatedButton(
                style: buttontwo,
                onPressed: () {
                  // Handle the second button press
                  print('Button 2 Pressed');
                },
                child: Text('สมัครสมาชิก',style: TextStyles.login,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
