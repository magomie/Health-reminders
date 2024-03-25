import 'package:flutter/material.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/custom_app_bar.dart';
import 'package:health_reminders/styles/text.dart';

class thresholdPage extends StatefulWidget {
  @override
  State<thresholdPage> createState() => _thresholdPageState();
}

class _thresholdPageState extends State<thresholdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      //resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
          title: "Threshold"),

      body: SafeArea(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(children: [
              SizedBox(
                height: 5,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'asset/image/run.jpg',
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
                      'การวิ่ง 30-60 นาที โดยใช้เพซสำหรับการวิ่ง threshold มีความเร็วในระดับที่สามารถรักษาไว้ได้คงที่โดยไม่หายใจหนักจนเกินไปซึ่งจะทำให้วิ่งช้าลงจะช่วยเพิ่มประสิทธิภาพทางด้านแอโรบิค และช่วยเผาผลาญแคลอรี่ได้มากกว่าการซ้อมวิ่งแบบอื่น',
                      style: TextStyles.common2,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ]),
            ]),
          ),
        ),
      ),
    );
  }
}
