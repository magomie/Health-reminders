import 'package:flutter/material.dart';
import 'package:health_reminders/controller/operator.dart';
import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';
import 'package:health_reminders/views/AppMenu/menu/account_setting.dart';

class settingPage extends StatelessWidget {
  const settingPage({Key? key}) : super(key: key);

  /*void initState() {
    NotificationProvider.checkReminders((userId));
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: white,
            elevation: 0.0,
            centerTitle: true,
            title: Text(
              'การตั้งค่า',
              style: TextStyle(
                color: Colors
                    .brown, // Assuming 'brown' is a defined color variable
                fontFamily: 'Garuda',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  'บัญชี',
                  style: TextStyles.common,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 5), // ปรับขนาดของปุ่มตามต้องการ
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // ให้มีมุมโค้ง
                        ),
                        //elevation: 5, // เพิ่มเงา
                        foregroundColor: Colors.white, // สีพื้นหลังของปุ่ม
                      ),
                      onPressed: () {
                        // Handle the first button press
                        print('go to drug notification');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => account_settingPage()),
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'ข้อมูลบัญชี',
                            style: TextStyles.common5,
                          ),
                          SizedBox(
                            width: 211,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 24,
                            color: const Color.fromARGB(255, 182, 182, 182),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 5), // ปรับขนาดของปุ่มตามต้องการ
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // ให้มีมุมโค้ง
                        ),
                        //elevation: 5, // เพิ่มเงา
                        foregroundColor: Colors.white, // สีพื้นหลังของปุ่ม
                      ),
                      onPressed: () {
                        // Handle the first button press
                        print('go to drug notification');
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'รหัสผ่าน',
                            style: TextStyles.common5,
                          ),
                          SizedBox(
                            width: 230,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 24,
                            color: const Color.fromARGB(255, 182, 182, 182),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  'การแจ้งเตือน',
                  style: TextStyles.common,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 5), // ปรับขนาดของปุ่มตามต้องการ
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // ให้มีมุมโค้ง
                        ),
                        //elevation: 5, // เพิ่มเงา
                        foregroundColor: Colors.white, // สีพื้นหลังของปุ่ม
                      ),
                      onPressed: () {
                        // Handle the first button press
                        print('go to drug notification');
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'เสียง',
                            style: TextStyles.common5,
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 5), // ปรับขนาดของปุ่มตามต้องการ
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // ให้มีมุมโค้ง
                        ),
                        //elevation: 5, // เพิ่มเงา
                        foregroundColor: Colors.white, // สีพื้นหลังของปุ่ม
                      ),
                      onPressed: () {
                        // Handle the first button press
                        print('go to drug notification');
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'ข่าวสารของระบบ',
                            style: TextStyles.common5,
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  'อื่น ๆ',
                  style: TextStyles.common,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 5), // ปรับขนาดของปุ่มตามต้องการ
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // ให้มีมุมโค้ง
                        ),
                        //elevation: 5, // เพิ่มเงา
                        foregroundColor: Colors.white, // สีพื้นหลังของปุ่ม
                      ),
                      onPressed: () {
                        // Handle the first button press
                        print('go to drug notification');
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'นโยบายความเป็นส่วนตัว',
                            style: TextStyles.common5,
                          ),
                          SizedBox(
                            width: 105,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 24,
                            color: const Color.fromARGB(255, 182, 182, 182),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 5), // ปรับขนาดของปุ่มตามต้องการ
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // ให้มีมุมโค้ง
                        ),
                        //elevation: 5, // เพิ่มเงา
                        foregroundColor: Colors.white, // สีพื้นหลังของปุ่ม
                      ),
                      onPressed: () {
                        // Handle the first button press
                        print('go to drug notification');
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'ช่วยเหลือ',
                            style: TextStyles.common5,
                          ),
                          SizedBox(
                            width: 220,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 24,
                            color: const Color.fromARGB(255, 182, 182, 182),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: buttonlgin,
            onPressed: () {
              UserOperator.logOut(context);
              print('ออกจากระบบ');
            },
            child: Text('ออกจากระบบ', style: TextStyles.Tlogin),
          ),
        ],
      ),
    );
  }
}
