import 'package:flutter/material.dart';
import 'package:health_reminders/styles/CustomAppBar.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';
import 'package:toggle_switch/toggle_switch.dart';

class bmi_bmr_page extends StatefulWidget {
  const bmi_bmr_page({Key? key}) : super(key: key);

  @override
  State<bmi_bmr_page> createState() => _bmi_bmr_pageState();
}

class _bmi_bmr_pageState extends State<bmi_bmr_page> {
  String? sexselect;
  List listsex = ["ชาย", "หญิง"];
  String? valueselect;
  List listitem = [
    "ไม่มีการออกกำลังกาย",
    "ออกกำลังกายเล็กน้อยอาทิตย์ละ 1-3 วัน",
    "ออกกำลังกายปานกลางอาทิตย์ละ 3-5 วัน",
    "ออกกำลังกายอย่างหนักอาทิตย์ละ 6-7 วัน",
    "ออกกำลังกายอย่างหนักทุกวัน"
  ];

  int _toggleValue = 0;

  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar(
          onBackButtonPressed: () {
            Navigator.pop(context);
          },
          title: "BMI/BMR"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            ToggleSwitch(
              minWidth: 150.0,
              initialLabelIndex: _toggleValue,
              totalSwitches: 2,
              activeBgColors: [
                [yellow!],
                [yellow!]
              ],
              activeFgColor: brown,
              inactiveBgColor: white,
              inactiveFgColor: brown,
              labels: ['BMI', 'BMR'],
              onToggle: (index) {
                setState(() {
                  _toggleValue = index!;
                });
              },
            ),
            SizedBox(height: 20), // Adjust the spacing based on your design

            // Content based on the selected toggle value
            _toggleValue == 0 ? _buildBMIContent() : _buildBMRContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildBMIContent() {
    // Customize the BMI content here
    return Container(
      color: white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: brown,
                            width: 1.5,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ค่าดัชนีมวลกาย',
                            style: TextStyles.Thome,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '0.0',
                            style: TextStyles.Tlogin,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '--',
                            style: TextStyles.common2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 31.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                'คำนวณค่าดัชนีมวลกาย',
                style: TextStyles.common4,
              ),
            ]),
          ),
          Column(children: [
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
          ]),
          SizedBox(
            height: 10,
          ),
          Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 140,
                width: 330,
                decoration: BoxDecoration(
                  //border: Border.all(color: brown, width: 1.0),
                  boxShadow: [
                    BoxShadow(
                      color: aa,
                      // blurRadius:5.0,
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                    padding: const EdgeInsets.only(left: 11, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'สูตรคำนวณ',
                          style: TextStyles.Tlogin,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text('น้ำหนักตัว (กิโลกรัม)',
                              style: TextStyles.common2),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text('÷', style: TextStyles.common3),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text('ส่วนสูง (เมตร) x ส่วนสูง (เมตร)',
                              style: TextStyles.common2),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBMRContent() {
    // Customize the BMR content here
    return Container(
      color: white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 220,
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border.all(color: brown, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'อัตราการเผาพลาญ',
                            style: TextStyles.common2,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '0.0',
                            style: TextStyles.Tlogin,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 31.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(
                'คำนวณอัตราการเผาพลาญ',
                style: TextStyles.common4,
              ),
            ]),
          ),
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 5.0,
                      left: 30,
                      top: 12.0,
                      bottom: 12.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 0.0,
                          horizontal: 8.0,
                        ),
                        child: DropdownButton(
                          hint: Text(
                            "เพศ",
                            style: TextStyle(
                              color: Colors.brown,
                              fontSize: 16,
                              fontFamily: 'Garuda',
                            ),
                          ),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.brown,
                          ),
                          iconSize: 36,
                          style: TextStyle(
                            color: Colors.brown,
                            fontSize: 16,
                            fontFamily: 'Garuda',
                          ),
                          value: sexselect,
                          onChanged: (newValue) {
                            setState(() {
                              sexselect = newValue as String?;
                            });
                          },
                          items: listsex.map((item) {
                            return DropdownMenuItem(
                              value: item as String?,
                              child: Text(
                                item!,
                                style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 16,
                                  fontFamily: 'Garuda',
                                ),
                              ),
                            );
                          }).toList(),
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
                      controller: ageController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'อายุ',
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
          ]),
          SizedBox(
            height: 1,
          ),
          Column(children: [
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
          ]),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
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
                  value: valueselect,
                  onChanged: (newValue) {
                    setState(() {
                      valueselect = newValue as String?;
                    });
                  },
                  items: listitem.map((item) {
                    return DropdownMenuItem(
                      value: item as String?,
                      child: Text(
                        item!,
                        style: TextStyle(
                          color: brown, // สีของเนื้อหาใน DropdownMenuItem
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
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: 330,
                decoration: BoxDecoration(
                  //border: Border.all(color: brown, width: 1.0),
                  boxShadow: [
                    BoxShadow(
                      color: aa,
                      // blurRadius:5.0,
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 11, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'สูตรคำนวณ',
                        style: TextStyles.Tlogin,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text('ผู้ชาย', style: TextStyles.common3),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                            '66 + (13.7 x น้ำหนักตัว กก.) + (5 x ส่วนสูง ซม.) - (6.8 x อายุ) ',
                            style: TextStyles.common2),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text('ผู้หญิง', style: TextStyles.common3),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                            '665 + (9.6 x น้ำหนักตัว กก.) + (1.8 x ส่วนสูง ซม.) - (4.7 x อายุ)',
                            style: TextStyles.common2),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text('BMR x ระดับการออกกำลังกาย',
                            style: TextStyles.common2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
