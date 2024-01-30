import 'package:flutter/material.dart';
import 'package:health_reminders/pages/notidoctor2.dart';
import 'package:health_reminders/pages/notidrug.dart';
import 'package:health_reminders/pages/notiexercise.dart';
import 'package:health_reminders/pages/notisleep.dart';
import 'package:health_reminders/pages/run.dart';
import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';

class exercise_adminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
         centerTitle: true,
        title: Text( 'ออกกำลังกาย', 
            style: TextStyle(
            color: Colors.brown, // Assuming 'brown' is a defined color variable
            fontFamily: 'Garuda',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            
          ),
        ),
      ),


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
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => notidrugPage()),
                      );
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
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => notidoctor2Page()),
                      );
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
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => notisleepPage()),
                      );
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
