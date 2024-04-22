import 'package:flutter/material.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/custom_app_bar.dart';
import 'package:health_reminders/styles/text.dart';

class LungeJumpPage extends StatefulWidget {
  @override
  State<LungeJumpPage> createState() => _LungeJumpPageState();
}

class _LungeJumpPageState extends State<LungeJumpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      //resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
          title: "Lunge Jump"),

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
                'asset/image/cardio-5.jpg',
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
                    ' 1.ยืนตรง มือทั้งสองข้างแนบข้างลำตัว กระโดดก้าวเท้าซ้ายออกไปด้านหน้า ย่อเข่าลงจนเข่าด้านหลังเกือบติดพื้น แขนทั้งสองข้างเหยียดไปด้านหลังว',
                    style: TextStyles.common2,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  Text(
                    ' 2.ดันตัวขึ้น พร้อมกระโดด ชูมือทั้งสองข้างขึ้นเหนือศีรษะ',
                    style: TextStyles.common2,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                  Text(
                    ' 3.สลับข้าง กระโดดก้าวเท้าขวาออกไปด้านหน้า ย่อเข่าลงจนเข่าด้านหลังเกือบติดพื้น แขนทั้งสองข้างเหยียดไปด้านหลัง นับเป็น 1 ครั้ง ทำซ้ำ 10-15 ครั้ง',
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
