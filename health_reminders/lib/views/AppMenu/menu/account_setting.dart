import 'package:flutter/material.dart';
import 'package:health_reminders/controller/plugin.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';

class account_settingPage extends StatelessWidget {
  final String userId;
  const account_settingPage({required this.userId});

  /*void initState() {
    NotificationProvider.checkReminders((widget.userId));
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading:
                  true, // This property is redundant and not needed here
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
              ),leading: IconButton(
          icon: Icon(Icons.arrow_back, color: brown),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: brown,
            ),
            onPressed: () {
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ),
              );*/
            },
          ),
        ],
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
      ),
    );
  }
}
