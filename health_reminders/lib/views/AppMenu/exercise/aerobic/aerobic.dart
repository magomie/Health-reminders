import 'package:flutter/material.dart';

import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/custom_app_bar.dart';
import 'package:health_reminders/styles/text.dart';
import 'package:health_reminders/views/AppMenu/exercise/aerobic/Heeltap.dart';
import 'package:health_reminders/views/AppMenu/exercise/aerobic/Shakeips.dart';
import 'package:health_reminders/views/AppMenu/exercise/aerobic/StepKnee.dart';
import 'package:health_reminders/views/AppMenu/exercise/aerobic/cha.dart';
import 'package:health_reminders/views/AppMenu/exercise/aerobic/closetouch.dart';
import 'package:health_reminders/views/AppMenu/exercise/aerobic/crosstouch.dart';
import 'package:health_reminders/views/AppMenu/exercise/aerobic/footsteps.dart';
import 'package:health_reminders/views/AppMenu/exercise/aerobic/heellift.dart';
import 'package:health_reminders/views/AppMenu/exercise/aerobic/kneelift.dart';
import 'package:health_reminders/views/AppMenu/exercise/aerobic/legtouching.dart';
import 'package:health_reminders/views/AppMenu/exercise/aerobic/mambo.dart';
import 'package:health_reminders/views/AppMenu/exercise/aerobic/quadrilateralwalk.dart';
import 'package:health_reminders/views/AppMenu/exercise/aerobic/squatstep.dart';
import 'package:health_reminders/views/AppMenu/exercise/aerobic/tapping.dart';
import 'package:health_reminders/views/AppMenu/exercise/aerobic/toestouchsides.dart';
import 'package:health_reminders/views/AppMenu/exercise/aerobic/walk.dart';

class arobicPage extends StatefulWidget {
  @override
  _arobicPageState createState() => _arobicPageState();
}

class _arobicPageState extends State<arobicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
          title: "แอโรบิค"),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double
                            .infinity, // ตั้งค่าเป็น double.infinity เพื่อให้ช่องว่างทั้งหมดเท่ากัน
                        height: 200.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('Button 1 Pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => footstepsPage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/image/aerobics.jpg',
                                width: 110,
                                height: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('การย่ำเท้า', style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('Button 2 Pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => walkPage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/image/aerobics.jpg',
                                width: 110,
                                height: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('การเดิน', style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('Button 2 Pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      quadrilateralwalkPage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/image/aerobics.jpg',
                                width: 110,
                                height: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('ก้าวรูปสี่เหลี่ยม',
                                  style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('Button 2 Pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => tappingPage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/image/aerobics.jpg',
                                width: 110,
                                height: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('การก้าวแตะ', style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('Button 2 Pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HeeltapPage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/image/aerobics.jpg',
                                width: 110,
                                height: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('ส้นเท้าแตะ', style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('Button 2 Pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => toestouchsidesPage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/image/aerobics.jpg',
                                width: 110,
                                height: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('ปลายเท้าแตะด้านข้าง',
                                  style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('Button 2 Pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => heelliftPage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/image/aerobics.jpg',
                                width: 110,
                                height: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('การยกส้นเท้า', style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('Button 2 Pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => crosstouchPage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/image/aerobics.jpg',
                                width: 110,
                                height: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('ก้าวไขว้ก้าวแตะ', style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('Button 2 Pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => mamboPage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/image/aerobics.jpg',
                                width: 110,
                                height: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('แมมโบ้', style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('Button 2 Pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => kneeliftPage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/image/aerobics.jpg',
                                width: 110,
                                height: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('ยกเข่า', style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('Button 2 Pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => legtouchingPage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/image/aerobics.jpg',
                                width: 110,
                                height: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('การแตะขา', style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('Button 2 Pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => closetouchPage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/image/aerobics.jpg',
                                width: 110,
                                height: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('ก้าวชิดก้าวแตะ', style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('Button 2 Pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => squatstepPage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/image/aerobics.jpg',
                                width: 110,
                                height: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('สควอท', style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('Button 2 Pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => chaPage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/image/aerobics.jpg',
                                width: 110,
                                height: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('ช่า ช่า ช่า', style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('Button 2 Pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShakeipsPage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/image/aerobics.jpg',
                                width: 110,
                                height: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('ส่ายสะโพก', style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 200.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('Button 2 Pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => StepKneePage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/image/aerobics.jpg',
                                width: 110,
                                height: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Step Knee', style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
