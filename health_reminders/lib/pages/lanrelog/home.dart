import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_reminders/pages/exercise/exercise.dart';
import 'package:health_reminders/pages/menu/bmr_bmr_page.dart';
import 'package:health_reminders/pages/menu/calcalorie.dart';
import 'package:health_reminders/pages/menu/food.dart';
import 'package:health_reminders/pages/menu/news.dart';
import 'package:health_reminders/pages/menu/profile.dart';
import 'package:health_reminders/pages/menu/setting.dart';
import 'package:health_reminders/pages/menu/water.dart';
import 'package:health_reminders/pages/notification/notification.dart';
import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';

class homePage extends StatefulWidget {
  final String userId;
  const homePage({required this.userId});

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePageContent(),
    profilePage(),
    settingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: white,
        selectedItemColor: yellow, // เปลี่ยนสีของข้อความที่เลือก
        unselectedItemColor: brown, // เปลี่ยนสีของข้อความที่ไม่ได้เลือก
        selectedFontSize: 16, // เปลี่ยนขนาดข้อความของข้อความที่เลือก
        unselectedFontSize: 14,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'โปรไฟล์',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'ตั้งค่า',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: white,
            centerTitle: true,
            elevation: 0.0,
            title: Text(
              'HEALTHREMINDER',
              style: TextStyle(
                color: Colors.brown,
                fontFamily: 'Garuda',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
                        child:
                            Text('สมศักดิ์ ณ กทม', style: TextStyles.common2),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'อายุ : 23 ปี',
                              style: TextStyles.common2,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text('เพศ : ชาย', style: TextStyles.common2),
                          ),
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
                    height: 80,
                    width: 330, // Set the desired height
                    decoration: BoxDecoration(
                      //border: Border.all(color: brown, width: 1.0),
                      boxShadow: [
                        BoxShadow(
                          color: bb,
                          // blurRadius:5.0,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
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
                SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    height: 80,
                    width: 330, // Set the desired height
                    decoration: BoxDecoration(
                      //border: Border.all(color: brown, width: 1.0),
                      boxShadow: [
                        BoxShadow(
                          color: bb,
                          // blurRadius:5.0,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
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
                SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    height: 80,
                    width: 330, // Set the desired height
                    decoration: BoxDecoration(
                      //border: Border.all(color: brown, width: 1.0),
                      boxShadow: [
                        BoxShadow(
                          color: gg,
                          // blurRadius:5.0,
                        ),
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
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
                          MaterialPageRoute(builder: (context) => foodPage()),
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
                          MaterialPageRoute(builder: (context) => waterPage()),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => bmi_bmr_page()),
                        );
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
                          MaterialPageRoute(builder: (context) => newsPage()),
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
    );
  }
}
