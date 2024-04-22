import 'package:flutter/material.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/custom_app_bar.dart';
import 'package:health_reminders/styles/text.dart';

class kneeliftPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
        title: "ยกเข่า",
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
                  'asset/image/arobic-10.jpg',
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'เป็นท่าการเคลื่อนไหวพื้นฐานในการพัฒนากล้ามเนื้อขาหรือ Knee Lift ได้อย่างดีดังนั้นแอโรบิก ด๊านซ์ทุกประเภทจึงมีท่าการยกเข่าทั้งการยกเข่าด้านหน้า ( Front Knee Lift )หรือ นีลีฟ ด้านข้าง ( Side Knee Lift ) การยกเข่าเฉียง ( Knee Cross )',
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
