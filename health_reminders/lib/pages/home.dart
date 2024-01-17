import 'package:flutter/material.dart';
import 'package:health_reminders/pages/addmenu.dart';
import 'package:health_reminders/pages/addmenucal.dart';
import 'package:health_reminders/pages/addmenucal.dart';
import 'package:health_reminders/pages/bmr_bmr_page.dart';
import 'package:health_reminders/pages/calcalorie.dart';
import 'package:health_reminders/pages/exercise.dart';
import 'package:health_reminders/pages/food.dart';
import 'package:health_reminders/pages/gender.dart';
import 'package:health_reminders/pages/news.dart';
import 'package:health_reminders/pages/notification.dart';
import 'package:health_reminders/pages/water.dart';
import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';

class homePage extends StatefulWidget {
  @override
  _informationPageState createState() => _informationPageState();
}

class _informationPageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // This property is redundant and not needed here
        centerTitle: true,
        title: Text(
          'HEALTHREMINDER',
          style: TextStyle(
            color: Colors.brown, // Assuming 'brown' is a defined color variable
            fontFamily: 'Garuda',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            
            children: <Widget>[
              SizedBox(
                height: 5,
              ),

              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 55,
                            backgroundColor: yellow,
                          ),
                        ],
                      ),
                    ),
                  ),

                  
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 1.0),
                            child: Text('สมศักดิ์ ณ กทม',style: TextStyles.common2),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: Text('อายุ : 23 ปี',style: TextStyles.common2,),),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(child: Text('เพศ : ชาย',style: TextStyles.common2),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),

              //menu bmi
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 65.0, // Set the desired height
                        child: ElevatedButton(
                          style: buttonlgin,
                          onPressed: () {
                            // Handle the first button press
                            print('Button 1 Pressed');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('น้ำหนัก', style: TextStyles.Thome),
                              Text('70', style: TextStyles.Thome1),
                              Text('กก.', style: TextStyles.Thome),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 65.0, // Set the desired height
                        child: ElevatedButton(
                          style: buttonlgin,
                          onPressed: () {
                            // Handle the first button press
                            print('Button 1 Pressed');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('ส่วนสูง', style: TextStyles.Thome),
                              Text('178', style: TextStyles.Thome1),
                              Text('ซม.', style: TextStyles.Thome),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Container(
                        width: double.infinity + 20,
                        height: 65.0, // Set the desired height
                        child: ElevatedButton(
                          style: buttonbmi,
                          onPressed: () {
                            // Handle the first button press
                            print('Button 1 Pressed');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('BMI', style: TextStyles.Thome),
                              Text('22.09', style: TextStyles.Thome1),
                              Text('ปกติ', style: TextStyles.Thome),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu,
                          color: brown,
                          size: 15.0,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'เมนู',
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double
                            .infinity, // ตั้งค่าเป็น double.infinity เพื่อให้ช่องว่างทั้งหมดเท่ากัน
                        height: 100.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('Button 1 Pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => calcaloriePage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //Icon(Icons.menu, color: brown,size: 15.0,),
                              Text('คำนวณแคลอรี่', style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('go to foodpage');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => foodPage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('อาหาร', style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('go to waterpage');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => waterPage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('น้ำ', style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double
                            .infinity, // ตั้งค่าเป็น double.infinity เพื่อให้ช่องว่างทั้งหมดเท่ากัน
                        height: 100.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('Button go to exercisepage');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => exercisePage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('ออกกำลังกาย', style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('Button 2 Pressed');
                            Navigator.push(context, MaterialPageRoute(builder:(context)=>bmi_bmr_page()),);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('BMI/BMR', style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('Button 3 Pressed');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotificationPage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('แจ้งเตือน', style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width:
                            20.0, // ตั้งค่าเป็น double.infinity เพื่อให้ช่องว่างทั้งหมดเท่ากัน
                        height: 100.0,
                        child: ElevatedButton(
                          style: buttonmanu,
                          onPressed: () {
                            // Handle the first button press
                            print('Button go to news page');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => newsPage()),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('ข่าวสารสุขภาพ', style: TextStyles.Tlogin),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Container(
                        width:
                            20.0, // ตั้งค่าเป็น double.infinity เพื่อให้ช่องว่างทั้งหมดเท่ากัน
                        height: 100.0,
                        child: SizedBox(),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Container(
                        width:
                            20.0, // ตั้งค่าเป็น double.infinity เพื่อให้ช่องว่างทั้งหมดเท่ากัน
                        height: 100.0,
                        child: SizedBox(),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
