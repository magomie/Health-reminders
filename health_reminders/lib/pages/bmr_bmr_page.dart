import 'package:flutter/material.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';
import 'package:toggle_switch/toggle_switch.dart';

class bmi_bmr_page extends StatefulWidget {
  const bmi_bmr_page({Key? key}) : super(key: key);

  @override
  State<bmi_bmr_page> createState() => _bmi_bmr_pageState();
}

class _bmi_bmr_pageState extends State<bmi_bmr_page> {
  int _toggleValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'BMI/BMR',
          style: TextStyle(
            color: Colors.brown,
            fontFamily: 'Garuda',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
                      Text(
                        'ยากจังอีผี', 
                        
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ]));
  }

  Widget _buildBMRContent() {
    // Customize the BMR content here
    return Container(
      child: Text(
        'BMR Content',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
