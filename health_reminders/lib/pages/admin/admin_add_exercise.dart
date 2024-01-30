import 'package:flutter/material.dart';
import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';

class admin_add_exercisePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController informationController = TextEditingController();
    final TextEditingController linkController = TextEditingController();
   

    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'เพิ่มการออกกำลังกาย',
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
                ),
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
                          labelText: 'ชื่อท่าออกกำลังกาย',
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
                            controller: informationController,
                            decoration: InputDecoration(
                              labelText: 'คำอธิบาย',
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
                                controller: linkController,
                                decoration: InputDecoration(
                                  labelText: 'link',
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
                            
                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  style: buttonlgin,
                                  onPressed: () {
                                    // Handle the first button press
                                    print('Button 1 Pressed');
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
              
            ),
          ),
        ),
      
    );
  }
}
