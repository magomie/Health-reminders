import 'package:flutter/material.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/custom_app_bar.dart';
import 'package:health_reminders/styles/text.dart';

class treeposePage extends StatefulWidget {
  @override
  State<treeposePage> createState() => _treeposePageState();
}

class _treeposePageState extends State<treeposePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      //resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
          title: "Tree Pose"),

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
                'asset/image/yoga-3.jpg',
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
                    'โยคะ ท่าต้นไม้ เริ่มต้นด้วยการยืนตรง ขาชิดกัน แขนแนบข้างลำตัว และให้ถ่ายน้ำหนักไปที่ขาข้างซ้าย จากนั้นยกขาขวาขึ้นและใช้มือจับข้อเท้ามาวางไว้ที่ต้นขาด้านในของขาซ้าย เมื่อร่างกายอยู่ในจุดที่สมดุลแล้วให้ทำการประกบฝ่ามือเข้าด้วยกัน หายใจเข้าและยืดแขนเหยียดตรงขึ้นด้านบนหากทรงตัวได้ยากสามารถพนมมือไว้กลางหน้าอกแทนได้ ค้างท่าไว้ 30-60 วินาที แล้วจึงค่อยลดมือลงและเปลี่ยนมาทำขาอีกข้าง',
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
