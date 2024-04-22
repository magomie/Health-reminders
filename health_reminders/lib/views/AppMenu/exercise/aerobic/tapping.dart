import 'package:flutter/material.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/custom_app_bar.dart';
import 'package:health_reminders/styles/text.dart';

class tappingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
        title: "การก้าวแตะ ",
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
                  'asset/image/arobic-4.jpg',
                  width: 200,
                  height: 200,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'การแตะด้วยส้นเท้าข้างใดข้างหนึ่ง โดยแตะข้างหน้าหรือด้านหลัง',
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
