import 'package:flutter/material.dart';
import 'package:health_reminders/controller/plugin.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';

class profilePage extends StatelessWidget {
  final String userId;
  const profilePage({required this.userId});

  /*void initState() {
    NotificationProvider.checkReminders((widget.userId));
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading:
                false, // This property is redundant and not needed here
            centerTitle: true,
            backgroundColor: white,
            elevation: 0.0,
            title: Text(
              'โปรไฟล์',
              style: TextStyle(
                color: Colors
                    .brown, // Assuming 'brown' is a defined color variable
                fontFamily: 'Garuda',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          showDataPlugin(
            docId: userId,
            otherClass: (context, usersData, healthData) => profileWidget(
                usersDataSet: usersData, healthDataSet: healthData),
          ),
        ],
      ),
    );
  }
}
