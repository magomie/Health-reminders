import 'package:flutter/material.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/custom_app_bar.dart';
import 'package:health_reminders/styles/text.dart';

class aerobic1Page extends StatefulWidget {
  @override
  State<aerobic1Page> createState() => _aerobic1PageState();
}

class _aerobic1PageState extends State<aerobic1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      //resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
          title: "การย่ำเท้า"),

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
                  'asset/image/arobic-1.jpg',
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
                      'การย่ำเท้าอยู่กับที่ ส่วนใหญ่แล้วจะย่ำเท้า 2 แบบคือ แบบกว้าง ( Marching Out ) และแบบแคบ ( Marching In )',
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
