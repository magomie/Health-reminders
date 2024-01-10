import 'package:flutter/material.dart';
import 'package:health_reminders/pages/notidrug2.dart';
import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';

class notidrugPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
         centerTitle: true,
        title: Text( 'เวลารับประทานยา', 
            style: TextStyle(
            color: Colors.brown, // Assuming 'brown' is a defined color variable
            fontFamily: 'Garuda',
            fontSize: 20,
            fontWeight: FontWeight.bold, 
          ),
        ),

        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline , color: brown,),
            onPressed: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => notidrug2Page()),
                      );
            },
          ),
        ],
      ),


      body: Center(
    
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                 Image.asset('asset/image/drug.png',width: 200,height: 200,)

              ],
            ),
          ),
    
      ),
    );
  }
}
