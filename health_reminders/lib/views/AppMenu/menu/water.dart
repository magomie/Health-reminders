import 'package:flutter/material.dart';
import 'package:health_reminders/controller/operator.dart';
import 'package:health_reminders/controller/plugin.dart';
import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/custom_app_bar.dart';
import 'package:health_reminders/styles/text.dart';

import 'package:intl/intl.dart';

class waterPage extends StatelessWidget {
  final String userId;
  waterPage({required this.userId});

  @override
  Widget build(BuildContext context) {
    double boxSizeWidth = 345;

    DateTime currentDate = DateTime.now();

    String formatteDate = DateFormat('dd/MM/yyyy').format(currentDate);

    final TextEditingController qtyController = TextEditingController();

    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
          title: "การดื่มน้ำ"),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25.0,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'วันที่ $formatteDate',
                            style: TextStyles.Tlogin,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  showDataHealthPlugin(
                    docId: userId,
                    otherClass: (context, healthData) =>
                        wathercalWidget(healthDataSet: healthData),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 70,
                        width: boxSizeWidth,

                        decoration: BoxDecoration(
                          border: Border.all(color: brown, width: 1.0),
                          boxShadow: [
                            BoxShadow(
                              color: noti,
                              //blurRadius: 5.0,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        //height: 60,

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 5),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('ปริมาณน้ำที่ได้รับวันนี้',
                                      style: TextStyles.common),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('0', style: TextStyles.common2),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('มิลลิลิตร', style: TextStyles.common),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'รายการการดื่มน้ำ',
                              style: TextStyles.common3,
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 55,
                        width: boxSizeWidth,
                        decoration: BoxDecoration(
                          //border: Border.all(color: brown, width: 1.0),
                          boxShadow: [
                            BoxShadow(
                              color: aa,
                              // blurRadius:5.0,
                            ),
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text(
                          'ไม่มีการดื่มน้ำ',
                          style: TextStyles.Tlogin,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.add_circle_outline,
                          color: brown,
                          size: 30,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                    height: 230,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "เพิ่มปริมาณการดื่มน้ำ",
                                          style: TextStyles.Tlogin,
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: TextField(
                                            controller: qtyController,
                                            decoration: InputDecoration(
                                              labelText: 'ปริมาณน้ำดื่ม',
                                              labelStyle: TextStyle(
                                                  color:
                                                      brown, // สีของ labelText
                                                  fontSize: 16,
                                                  fontFamily:
                                                      'Garuda' // ขนาด font ของ labelText
                                                  ),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 12.0,
                                                      horizontal: 15.0),
                                              border: OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey,
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey,
                                                    width: 1.0),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton(
                  style: buttonlgin,
                  onPressed: () {
                    // Handle the first button press
                    print('Button SignUp Pressed');
                  
                  },
                  child: Text('เพิ่ม', style: TextStyles.Tlogin),
                ),

                                      ],
                                    ),
                                    
                                  ));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
