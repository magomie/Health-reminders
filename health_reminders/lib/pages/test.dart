import 'dart:io';

import 'package:flutter/material.dart';
import 'package:health_reminders/pages/lanrelog/home.dart';
import 'package:health_reminders/styles/CustomAppBar.dart';
import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';

class informationTestPage extends StatefulWidget {
  @override
  _informationPageTestState createState() => _informationPageTestState();
}

class _informationPageTestState extends State<informationTestPage> {
  final ImagePicker _picker = ImagePicker();
  File? _file;
  int? activityLevel;

  List listitem = [
    "ไม่มีการออกกำลังกาย",
    "ออกกำลังกายเล็กน้อยอาทิตย์ละ 1-3 วัน",
    "ออกกำลังกายปานกลางอาทิตย์ละ 3-5 วัน",
    "ออกกำลังกายอย่างหนักอาทิตย์ละ 6-7 วัน",
    "ออกกำลังกายอย่างหนักทุกวัน"
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  Future<void> pickImage() async {
    final PickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (PickedFile != null) {
      setState(() {
        _file = File(PickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
          title: "ข้อมูล"),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: pickImage,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: yellow),
                          child: _file != null
                              ? ClipOval(
                                  child: Image.file(
                                    _file!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Icon(
                                  Icons.photo_outlined,
                                  size: 60,
                                  color: brown,
                                ),
                        ),
                      )
                    ],
                  ),
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
                      right: 30.0,
                      left: 30.0,
                      top: 12.0,
                      bottom: 12.0,
                    ),

                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // สีขอบ
                          width: 1.0, // ขนาดความหนาขอบ
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 8.0),
                        child: DropdownButton(
                          hint: Text(
                            "ระดับการออกกำลังกาย",
                            style: TextStyle(
                              color: brown, // สีของ hint text
                              fontSize: 16, // ขนาด font ของ hint text
                              fontFamily: 'Garuda',
                            ),
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: brown,
                          ),
                          iconSize: 36,
                          style: TextStyle(
                            color: brown,
                            fontSize: 16,
                            fontFamily: 'Garuda',
                          ),
                          value: activityLevel,
                          onChanged: (newValue) {
                            setState(() {
                              activityLevel = listitem.indexOf(newValue);
                            });
                          },
                          items: listitem.map((item) {
                            return DropdownMenuItem(
                              value: item as String?,
                              child: Text(
                                item!,
                                style: TextStyle(
                                  color:
                                      brown, // สีของเนื้อหาใน DropdownMenuItem
                                  fontSize:
                                      16, // ขนาด font ของเนื้อหาใน DropdownMenuItem
                                  fontFamily: 'Garuda',
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
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
                  // Handle the button press to save data
                  if (activityLevel != null) {
                    // ตรวจสอบว่าผู้ใช้เลือกระดับการออกกำลังกายหรือไม่
                    // ทำการบันทึกข้อมูลลง Firestore หรือทำการประมวลผลต่อไปตามต้องการ
                    print('ชื่อ: ${nameController.text}');
                    print('อายุ: ${ageController.text}');
                    print('น้ำหนัก: ${weightController.text}');
                    print('ส่วนสูง: ${heightController.text}');
                    print('ระดับการออกกำลังกาย: $activityLevel');
                  } else {
                    // ถ้าผู้ใช้ยังไม่ได้เลือกระดับการออกกำลังกาย
                    print('โปรดเลือกระดับการออกกำลังกาย');
                  }
                },
                child: Text('ยืนยัน', style: TextStyles.Tlogin),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
