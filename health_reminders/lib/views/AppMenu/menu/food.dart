import 'package:flutter/material.dart';
import 'package:health_reminders/controller/plugin.dart';

import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';
import 'package:health_reminders/views/AppMenu/menu/Addmenucal_Page.dart';

class foodPage extends StatefulWidget {
  final String userId;

  const foodPage({required this.userId});

  @override
  State<foodPage> createState() => _foodPageState();
}

class _foodPageState extends State<foodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'อาหาร',
          style: TextStyle(
            color: Colors.brown, // Assuming 'brown' is a defined color variable
            fontFamily: 'Garuda',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: brown),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Column(
              children: [
                /*Icon(
                  Icons.food_bank_sharp,
                  color: brown,
                ),*/
                Text(
                  'สร้างเมนู',
                  style: TextStyles.Tlogin,
                ),
              ],
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => addmenucalPage(
                          userId: widget.userId,
                        )),
              );
            },
            tooltip: 'สร้างเมนู',
          ),
        ],
      ),
      body: Center(
        child: showDataPlugin(
          docId: widget.userId,
          otherClass: (context, usersData, healthData) => BuildFoodListView(
              usersDataSet: usersData, healthDataSet: healthData),
        ),
      ),
    );
  }
}
