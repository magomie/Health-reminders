import 'package:flutter/material.dart';
import 'package:health_reminders/pages/lanrelog/home.dart';
import 'package:health_reminders/pages/lanrelog/information.dart';
import 'package:health_reminders/styles/CustomAppBar.dart';
import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';
import 'package:page_transition/page_transition.dart';

class genderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBarTextActions(
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
        title: '',
        onActionButtonPressed: () {
          Navigator.push(
            context,
            PageTransition(
                child: homePage(), type: PageTransitionType.rightToLeft),
          );
        },
        textAction: 'ข้าม',
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 190,
              ),
              Column(
                children: [
                  Text(
                    'เพศ',
                    style: TextStyle(
                        color: Color.fromRGBO(107, 89, 24, 1),
                        fontFamily: 'Garuda',
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: ElevatedButton(
                        style: buttonwomen,
                        onPressed: () {
                          // Handle the first button press
                          print('Button 1 Pressed');
                          Navigator.push(
                            context,
                            PageTransition(
                                child: informationPage(),
                                type: PageTransitionType.rightToLeft),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              color: brown,
                            ),
                            Text(
                              'ผู้หญิง',
                              style: TextStyles.login,
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: ElevatedButton(
                      style: buttonman,
                      onPressed: () {
                        // Handle the second button press
                        print('Button 2 Pressed');
                        Navigator.push(
                          context,
                          PageTransition(
                              child: informationPage(),
                              type: PageTransitionType.rightToLeft),
                        );
                      },
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // จัดตำแหน่ง
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            color: brown,
                          ),
                          //SizedBox(width: 8),

                          Text(
                            'ผู้ชาย',
                            style: TextStyles.login,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
