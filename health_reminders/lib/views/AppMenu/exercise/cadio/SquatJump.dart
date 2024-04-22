import 'package:flutter/material.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/custom_app_bar.dart';
import 'package:health_reminders/styles/text.dart';

class SquatJumpPage extends StatefulWidget {
  @override
  State<SquatJumpPage> createState() => _SquatJumpPageState();
}

class _SquatJumpPageState extends State<SquatJumpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      //resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
          title: "Squat Jump"),

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
                'asset/image/cardio-4.jpg',
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
                    ' 1.ยืนตรง แยกเท้าห่างจากกันเล็กน้อย มือทั้งสองข้างแตะไว้ด้านหลังศีรษะ จากนั้นย่อตังลง ทิ้งก้นไปด้านหลัง',
                    style: TextStyles.common2,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  Text(
                    ' 2.ดันตัวขึ้น พร้อมกระโดด ทำซ้ำ 10-15 ครั้ง',
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
