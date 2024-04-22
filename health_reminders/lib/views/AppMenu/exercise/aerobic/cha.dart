import 'package:flutter/material.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/custom_app_bar.dart';
import 'package:health_reminders/styles/text.dart';

class chaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
        title: "ช่า ช่า ช่า",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
        
            children: [
              SizedBox(height: 5),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'asset/image/arobic-14.jpg',
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'การก้าวใดเท้าหนึ่งไขว้ไปด้านหน้า ย่ำเท้าหลัง แล้วนำเท้ากลับที่ก้าวไปข้างหน้ากลับมา ย่ำ ย่ำ ย่ำ สลับเท้า',
                style: TextStyles.common2,
                softWrap: true,
                    overflow: TextOverflow.visible,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
