import 'package:flutter/material.dart';

import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/custom_app_bar.dart';
import 'package:health_reminders/styles/text.dart';
import 'package:health_reminders/views/AppMenu/Addmenucal_Page.dart';
import 'package:health_reminders/views/AppMenu/exercise/Threshold.dart';
import 'package:health_reminders/views/AppMenu/exercise/exercise.dart';

class runPage extends StatefulWidget {
  @override
  _informationPageState createState() => _informationPageState();
}

class _informationPageState extends State<runPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
          title: "การวิ่ง"),
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
                            /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => addmenucalPage()),
                            );*/
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/image/run.jpg',
                                width: 110,
                                height: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Speedwork', style: TextStyles.Tlogin),
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
                                  builder: (context) => thresholdPage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/image/run.jpg',
                                width: 110,
                                height: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Threshold Session',
                                  style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
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
                            print('Button go to exercisepage');
                            /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => exercisePage()),
                            );*/
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/image/run.jpg',
                                width: 110,
                                height: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Speed-Stamina Workout',
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
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'asset/image/run.jpg',
                                width: 110,
                                height: 110,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Relaxed Long Run',
                                  style: TextStyles.Tlogin),
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
