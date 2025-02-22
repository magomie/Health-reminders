import 'package:flutter/material.dart';
import 'package:health_reminders/pages/notisleep2.dart';
import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';

class notisleepPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
         centerTitle: true,
        title: Text( 'เวลานอน', 
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

        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline , color: brown,),
            onPressed: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => notisleep2Page()),
                      );
            },
          ),
        ],
      ),


      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[

  

              ],
            ),
          ),
        ),
      ),
    );
  }
}
