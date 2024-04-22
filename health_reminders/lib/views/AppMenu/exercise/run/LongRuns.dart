import 'package:flutter/material.dart';
import 'package:health_reminders/styles/custom_app_bar.dart';
import 'package:health_reminders/styles/text.dart';

class LongRunsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
        title: "Long Runs",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          
          children: [
            SizedBox(height: 5),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'asset/image/longrun.jpg',
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'เป็นการวิ่งที่ไม่เน้นความเร็ว แต่เน้นวิ่งให้ได้ระยะทางที่ไกล ซึ่งช่วยสร้างความทนทานและความแข็งแรงของกล้ามเนื้อ และทำให้หัวใจแข็งแรงขึ้น ซึ่งการวิ่งยาวถือเป็นการสร้างพื้นฐานที่ดีแก่นักวิ่ง',
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
