import 'package:flutter/material.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/custom_app_bar.dart';
import 'package:health_reminders/styles/text.dart';

class quadrilateralwalkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
        title: "ก้าวรูปสี่เหลี่ยม",
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
                  'asset/image/arobic-3.jpg',
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'การก้าวเดินไปข้าง 1 ก้าว ถอยหลัง 1 ก้าว ลักษณะคล้าย V-step แต่วางเท้าเป็นรูปสี่เหลี่ยม หรืการก้าวเดิน',
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
