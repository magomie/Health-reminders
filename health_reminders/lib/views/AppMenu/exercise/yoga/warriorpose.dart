import 'package:flutter/material.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/custom_app_bar.dart';
import 'package:health_reminders/styles/text.dart';

class warriorposePage extends StatefulWidget {
  @override
  State<warriorposePage> createState() => _warriorposePageState();
}

class _warriorposePageState extends State<warriorposePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      //resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
          title: "Warrior Pose"),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(children: [
            SizedBox(
              height: 5,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'asset/image/yoga-2.jpg',
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(
              width: 50.0,
            ),
            SizedBox(
              height: 20,
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'โยคะ ท่านักรบ สามารถทำต่อจากท่า Downward Facing Dog ได้เลย โดยหายใจเข้า ก้าวเท้าขวาไปด้านหน้า วางเท้าขวาระหว่างมือ โดยงอเข่าด้านขวา และขาซ้ายเหยียดตรง จากนั้น ถ่ายน้ำหนักไปที่เท้าทั้งสองข้างให้เท่ากันจากนั้นยกตัวขึ้น โดยงอเข่าขวาเป็นมุมฉาก และยกแขนทั้งสองข้างขึ้น ค้างในท่านี้ ไว้ประมาณ 30-60 วินาที แล้วกลับไปสู่ท่า Downward Facing Dog แล้วจึงค่อยสลับทำอีกข้าง',
                    style: TextStyles.common2,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ]),
          ]),
        ),
      ),
    );
  }
}
