import 'package:flutter/material.dart';
import 'package:health_reminders/styles/CustomAppBar.dart';
import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';
import 'package:intl/intl.dart';

class waterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double boxSizeWidth = 345;

    DateTime currentDate = DateTime.now();

    String formatteDate = DateFormat('dd/MM/yyyy').format(currentDate);

    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(onBackButtonPressed: () {Navigator.pop(context);}, 
      title: "การดื่มน้ำ"
        ),
        
        
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
                                  Text('ปริมาณน้ำที่ได้รับ',
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
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: 5),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('ปริมาณน้ำที่ควรได้รับต่อวัน',
                                      style: TextStyles.common),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '0',
                                    style: TextStyles
                                        .common2, // You can customize the style
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'มิลลิลิตร',
                                    style: TextStyles
                                        .common, // You can customize the style
                                    textAlign: TextAlign.end,
                                  ),
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
                          /*Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => notidrug2Page()),
                                                    );*/
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
