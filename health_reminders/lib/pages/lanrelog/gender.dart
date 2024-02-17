import 'package:flutter/material.dart';
import 'package:health_reminders/controller/operator.dart';
import 'package:health_reminders/pages/lanrelog/home.dart';
import 'package:health_reminders/pages/lanrelog/information.dart';
import 'package:health_reminders/styles/CustomAppBar.dart';
import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';
import 'package:page_transition/page_transition.dart';

class genderPage extends StatelessWidget {
  final String userId;
  final String email;
  final String password;
  genderPage(
      {required this.userId, required this.email, required this.password});
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
          //skip
          UserOperator.addInfo(
              context, email, password, userId, '', '', 0, 0.0, 0.0, 0);
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
                          print('Button หญิง Pressed');
                          Navigator.push(
                            context,
                            PageTransition(
                                child: informationPage(
                                  userId: userId,
                                  gender: 'F',
                                  email: email,
                                  password: password,
                                ),
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
                        print('Button ชายแทร่ Pressed');
                        Navigator.push(
                          context,
                          PageTransition(
                              child: informationPage(
                                userId: userId,
                                gender: 'M',
                                email: email,
                                password: password,
                              ),
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
