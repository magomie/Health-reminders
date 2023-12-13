import 'package:flutter/material.dart';
import 'package:health_reminders/pages/gender.dart';
import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';

class homePage extends StatefulWidget {
  @override
  _informationPageState createState() => _informationPageState();
}

class _informationPageState extends State<homePage> {
 

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
     
     appBar:  AppBar(
   automaticallyImplyLeading: false, // This property is redundant and not needed here
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             

               

               SizedBox(
                height: 7,
              ),

              Row(
                  
                  children: [

                    
                    SizedBox(width: 10,), 

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: yellow,
                            ),
                            Positioned(
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.photo_outlined,
                                  size: 50,
                                ),
                              ),
                              top: 14 - 8,
                              left: 14 - 7,
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
                              child: Text('สมศักดิ์ ณ กทม'),
                            ),
                            
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: Text('อายุ : 23 ปี')),
                                SizedBox(width: 10,),
                                Expanded(child: Text('เพศ : ชาย'))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                     SizedBox(width: 100,), 
                  ],
                ),


              
                
              
              SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                    ),
                    child: Text(
                      'กรุณากรอกข้อมูลทั้งหมด',
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 12.0),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: 'ชื่อ',
                        labelStyle: TextStyle(
                            color: brown, // สีของ labelText
                            fontSize: 16,
                            fontFamily: 'Garuda' // ขนาด font ของ labelText
                            ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 15.0),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 12.0),
                    child: TextField(
                      controller: ageController,
                      decoration: InputDecoration(
                        labelText: 'อายุ',
                        labelStyle: TextStyle(
                            color: brown, // สีของ labelText
                            fontSize: 16,
                            fontFamily: 'Garuda' // ขนาด font ของ labelText
                            ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 15.0),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 2.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                   SizedBox(
                    height: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Adjust the alignment as needed
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 5.0,
                            left: 30,
                            top: 12.0,
                            bottom: 12.0,
                            
                          ),
                          child: TextField(
                            controller: weightController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'น้ำหนัก (กก.)',
                              labelStyle: TextStyle(
                                color: Colors.brown,
                                fontSize: 16,
                                fontFamily: 'Garuda',
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 15.0),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 1),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 30.0,
                            left: 5,
                            top: 12.0,
                            bottom: 12.0,
                            
                          ),
                          child: TextField(
                            controller: heightController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'ส่วนสูง (ซม.) ',
                              labelStyle: TextStyle(
                                color: Colors.brown,
                                fontSize: 16,
                                fontFamily: 'Garuda',
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 15.0),
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1,
                  ),
              Padding(
                padding: const EdgeInsets.only(
                            right: 30.0, left: 30.0, top: 12.0 , bottom: 12.0,
                           
                ),


                //SizedBox(
                // height: 10,
              ),

                ],
              ),
              SizedBox(
                height: 1,
              ),
              
              ElevatedButton(
                style: buttonlgin,
                onPressed: () {
                  // Handle the first button press
                  print('Button 1 Pressed');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => genderPage()),
                  );
                },
                child: Text('ยืนยัน', style: TextStyles.Tlogin),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  // Handle the "Forgot Password" action
                  print('go to loginpage');
                },
                child: Text(
                  'เข้าสู่ระบบ',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 43, 48, 53),
                    fontSize: 14,
                    fontFamily: 'Garuda',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
