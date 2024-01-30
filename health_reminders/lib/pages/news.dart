import 'package:flutter/material.dart';
import 'package:health_reminders/pages/Addmenu_Page.dart';
import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';

class newsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'ข่าวสารสุขภาพ',
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
      ),
      body: SafeArea(
        child: Expanded(
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
                    ]),
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
                          top: 0.0, bottom: 0.0, left: 15.0, right: 0.0),
                      child: Container(
                        width: 210.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('โควิดแพร่กระจายตัวอย่างไร',
                                style: TextStyles.Tlogin),
                            Text(
                              'ติดโควิดควรทานยาอย่างไรดูแลตัวเองแบบไหน',
                              style: TextStyles.common2,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('อ่านเพิ่มเติม'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
