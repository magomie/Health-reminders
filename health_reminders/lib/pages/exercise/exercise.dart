import 'package:flutter/material.dart';
import 'package:health_reminders/pages/notification/notidoctor2.dart';
import 'package:health_reminders/pages/notification/notidrug.dart';
import 'package:health_reminders/pages/notification/notiexercise.dart';
import 'package:health_reminders/pages/notification/notisleep.dart';
import 'package:health_reminders/pages/exercise/run.dart';
import 'package:health_reminders/styles/CustomAppBar.dart';
import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';

class exercisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
          title: "ออกกำลังกาย"),

      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[

                SizedBox(
                  height: 10,
                ),
                
                Column(
                children: [
                  Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25),
                    child:Container(
                      height: 60,
                    child: ElevatedButton(
                      style: buttonnoti,
                      onPressed: () {
                        // Handle the first button press
                        print('Button 1 Pressed');
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => runPage()),
                      );
                      },
                      
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                                  Image.asset(
                                  'asset/image/exercise.png',
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(width: 15,),
                                  Text('การวิ่ง',
                                    style: TextStyles.head,
                                  ),
                      ],
                      ) 
                    ),
                  ),
                  ),
                ],
              ),

               SizedBox(
                  height: 10,
                ),
                
                Column(
                children: [
                  Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25),
                    child:Container(
                      height: 60,
                    child: ElevatedButton(
                      style: buttonnoti,
                      onPressed: () {
                        // Handle the first button press
                        print('go to drug notification');
                        
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                                  Image.asset(
                                  'asset/image/cardio.png',
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(width: 15,),
                                  Text('คาดิโอ',
                                    style: TextStyles.head,
                                  ),
                      ],
                      ) 
                    ),
                  ),
                  ),
                ],
              ),

              SizedBox(
                  height: 10,
                ),
                
                Column(
                children: [
                  Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25),
                    child:Container(
                      height: 60,
                    child: ElevatedButton(
                      style: buttonnoti,
                      onPressed: () {
                        // Handle the first button press
                        print('go to doctor notification');
                        
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                                 Image.asset(
                                  'asset/image/yoga.png',
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(width: 15,),
                                  Text('โยคะ',
                                    style: TextStyles.head,
                                  ),
                      ],
                      ) 
                    ),
                  ),
                  ),
                ],
              ),

              SizedBox(
                  height: 10,
                ),
                
                Column(
                children: [
                  Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25),
                    child:Container(
                      height: 60,
                    child: ElevatedButton(
                      style: buttonnoti,
                      onPressed: () {
                        
                        print('go to sleepy notification');
                        
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                                 Image.asset(
                                  'asset/image/aerobic.png',
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(width: 15,),
                                  Text('แอโรบิค',
                                    style: TextStyles.head,
                                  ),
                      ],
                      ) 
                    ),
                  ),
                  ),
                ],
              ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
