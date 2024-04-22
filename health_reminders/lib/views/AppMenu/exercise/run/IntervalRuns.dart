import 'package:flutter/material.dart';
import 'package:health_reminders/styles/custom_app_bar.dart';
import 'package:health_reminders/styles/text.dart';

class IntervalRunsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
        title: "Interval Runs",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(height: 5),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'asset/image/intervalrun.png',
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'การวิ่งเบาสลับหนักเป็นการใช้พลังงานแทบทั้งหมดจากคาร์บหลังจากวิ่งเสร็จจะทำให้ร่างกายเกิด Afterburn เผาผลาญไขมันได้มากกว่าปกติ 12-24 ชม ใช้ลดน้ำหนักควบคู่กับการออกแบบ Low zone เหมาะกับคนที่สุขภาพแข็งแรง ไม่มีโรคซ่อน โดยเฉพาะโรคหัวใจ',
              style: TextStyles.common2,
             softWrap: true,
                    overflow: TextOverflow.visible,
            ),
          ],
        ),
      ),
    );
  }
}
