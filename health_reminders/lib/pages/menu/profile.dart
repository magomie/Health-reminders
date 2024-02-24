import 'package:flutter/material.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';

class profilePage extends StatelessWidget {
  final String userId;
  const profilePage({required this.userId});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading:
                false, // This property is redundant and not needed here
            centerTitle: true,
            title: Text(
              'โปรไฟล์',
              style: TextStyle(
                color: Colors
                    .brown, // Assuming 'brown' is a defined color variable
                fontFamily: 'Garuda',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundColor: yellow,
                  ),
                ],
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
                padding: const EdgeInsets.only(left: 35),
                child: Text(
                  'ข้อมูลส่วนตัว',
                  style: TextStyles.Tlogin,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35, top: 10),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ชื่อ',
                            style: TextStyles.Tlogin,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 56,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'สมศํกดิ์ ณ กทม',
                            style: TextStyles.common5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35, top: 10),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'อายุ',
                            style: TextStyles.Tlogin,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '23 ปี',
                            style: TextStyles.common5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35, top: 10),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'เพศ',
                            style: TextStyles.Tlogin,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ชาย',
                            style: TextStyles.common5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Text(
                  'ข้อมูลสุขภาพ',
                  style: TextStyles.Tlogin,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35, top: 10),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'น้ำหนัก',
                            style: TextStyles.Tlogin,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '70',
                            style: TextStyles.common5,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'กิโลกรัม',
                            style: TextStyles.common5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35, top: 10),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ส่วนสูง',
                            style: TextStyles.Tlogin,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 61,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '178',
                            style: TextStyles.common5,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 53,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'เซนติเมตร',
                            style: TextStyles.common5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35, top: 10),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BMI',
                            style: TextStyles.Tlogin,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '22',
                            style: TextStyles.common5,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 62,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ปกติ',
                            style: TextStyles.common6,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35, top: 10),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BMR',
                            style: TextStyles.Tlogin,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 72),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '1756',
                            style: TextStyles.common5,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 43,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'ต่อวัน',
                            style: TextStyles.common5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
