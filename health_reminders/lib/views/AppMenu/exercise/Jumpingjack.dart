import 'package:flutter/material.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/custom_app_bar.dart';
import 'package:health_reminders/styles/text.dart';

class JumpingjackPage extends StatefulWidget {
  @override
  State<JumpingjackPage> createState() => _JumpingjackPageState();
}

class _JumpingjackPageState extends State<JumpingjackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      //resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
          title: "Jumping Jack"),

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
                  'asset/image/cardio-1.jpg',
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' 1.ยืนตรงเท้าชิด มือ 2 ข้างแนบข้างลำตัว',
                      style: TextStyles.common2,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    Text(
                      ' 2.กระโดดพร้อมแยกขาออกจากกันมือทั้งสองข้างยกขึ้นเหนือศีรษะ',
                      style: TextStyles.common2,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    Text(
                      ' 3.กระโดดกลับที่ท่าเริ่มต้น ทำซ้ำจนครบ 1-2 นาที',
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
