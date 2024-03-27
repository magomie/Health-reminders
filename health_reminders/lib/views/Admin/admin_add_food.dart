import 'dart:async';
import 'dart:io';
import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:health_reminders/controller/operator.dart';
import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';
import 'package:image_picker/image_picker.dart';

class admin_add_foodPage extends StatefulWidget {
  @override
  State<admin_add_foodPage> createState() => _admin_add_foodPageState();
}

class _admin_add_foodPageState extends State<admin_add_foodPage> {
  final ImagePicker _picker = ImagePicker();

  File? _file;

  FutureOr<void> pickImage() async {
    final PickedFile? pickedFile =
        (await _picker.pickImage(source: ImageSource.gallery)) as PickedFile?;
    if (pickedFile != null) {
      setState(() {
        _file = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController callorieController = TextEditingController();
    final TextEditingController sodiumController = TextEditingController();
    final TextEditingController sweetController = TextEditingController();
    final TextEditingController fatController = TextEditingController();

    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'เพิ่มเมนูอาหาร',
          style: TextStyle(
            color: Colors.brown, // Assuming 'brown' is a defined color variable
            fontFamily: 'Garuda',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: brown),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[
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
                                shape: BoxShape.rectangle, color: aa),
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
                /*Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        //border: Border.all(color: brown, width: 1.0),
                        boxShadow: [
                          BoxShadow(
                            color: aa,
                            // blurRadius:5.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(left: 10, top: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'รูปภาพ',
                                style: TextStyles.Tlogin,
                              ),
                            ],
                          )),
                    ),
                  ],
                ),*/
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25.0,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'กรุณากรอกข้อมูล',
                          style: TextStyles.common2,
                          textAlign: TextAlign.end,
                        ),
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
                          labelText: 'ชื่ออาหาร',
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
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 12.0),
                          child: TextField(
                            controller: callorieController,
                            decoration: InputDecoration(
                              labelText: 'จำนวนแคลอรี่',
                              labelStyle: TextStyle(
                                  color: brown, // สีของ labelText
                                  fontSize: 16,
                                  fontFamily:
                                      'Garuda' // ขนาด font ของ labelText
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
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 12.0),
                              child: TextField(
                                controller: sweetController,
                                decoration: InputDecoration(
                                  labelText: 'ปริมาณน้ำตาล',
                                  labelStyle: TextStyle(
                                      color: brown, // สีของ labelText
                                      fontSize: 16,
                                      fontFamily:
                                          'Garuda' // ขนาด font ของ labelText
                                      ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 15.0),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 12.0),
                                  child: TextField(
                                    controller: sodiumController,
                                    decoration: InputDecoration(
                                      labelText: 'ปริมาณโซเดียม',
                                      labelStyle: TextStyle(
                                          color: brown, // สีของ labelText
                                          fontSize: 16,
                                          fontFamily:
                                              'Garuda' // ขนาด font ของ labelText
                                          ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 12.0, horizontal: 15.0),
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0, vertical: 12.0),
                                      child: TextField(
                                        controller: fatController,
                                        decoration: InputDecoration(
                                          labelText: 'ปริมาณไขมัน',
                                          labelStyle: TextStyle(
                                              color: brown, // สีของ labelText
                                              fontSize: 16,
                                              fontFamily:
                                                  'Garuda' // ขนาด font ของ labelText
                                              ),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: 15.0),
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 2.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey, width: 1.0),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  style: buttonlgin,
                                  onPressed: () {
                                    print('Button 1 Pressed');

                                    UserOperator.addFood(
                                        context,
                                        _file,
                                        nameController.text.trim(),
                                        double.parse(
                                            callorieController.text.trim()),
                                        double.parse(fatController.text.trim()),
                                        double.parse(
                                            sweetController.text.trim()),
                                        double.parse(
                                            sodiumController.text.trim()));
                                  },
                                  child: Text('เพิ่มข้อมูล',
                                      style: TextStyles.Tlogin),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
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
