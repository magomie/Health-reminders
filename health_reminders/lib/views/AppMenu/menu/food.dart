import 'package:flutter/material.dart';

import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';
import 'package:health_reminders/views/AppMenu/Addmenu_Page.dart';

class foodPage extends StatelessWidget {
  /*void initState() {
    NotificationProvider.checkReminders((widget.userId));
  }*/

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
            icon: Icon(
              Icons.add_circle_outline,
              color: brown,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => addmenuPage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: noti,
                    //blurRadius: 5.0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'asset/image/mumu.jpg',
                      width: 110,
                      height: 110,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, bottom: 0.0, left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ข้าวหมูกรอบ', style: TextStyles.Tlogin),
                        Text('แคลอรี่ : 490 แคล', style: TextStyles.common),
                        Text('น้ำตาล : 20.4 กรัม', style: TextStyles.common),
                        Text('โซเดียม : 20.0 กรัม', style: TextStyles.common),
                        Text('ไขมัน : 21.8 กรัม', style: TextStyles.common),
                      ],
                    ),
                  ),
                  SizedBox(width: 50.0),
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.add_circle_outline,
                          color: brown,
                        ),
                        onPressed: () {
                          /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => notidrug2Page()),
                    );*/
                        },
                      ),
                      SizedBox(height: 80.0),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
