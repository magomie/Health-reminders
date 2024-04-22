import 'package:flutter/material.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/custom_app_bar.dart';
import 'package:health_reminders/styles/text.dart';

class ShakeipsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
        title: "ส่ายสะโพก",
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
                  'asset/image/arobic-15.jpg',
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'การส่ายสะโพกซ้าย – ขวา สลับกัน',
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
