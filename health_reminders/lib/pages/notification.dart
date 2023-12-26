import 'package:flutter/material.dart';
import 'package:health_reminders/styles/button.dart';
import 'package:health_reminders/styles/color.dart';
import 'package:health_reminders/styles/text.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
         centerTitle: true,
        title: Text( 'การแจ้งเตือน', 
            style: TextStyle(
            color: Colors.brown, // Assuming 'brown' is a defined color variable
            fontFamily: 'Garuda',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            
          ),
        ),
      ),


      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: <Widget>[

                SizedBox(
                  height: 10,
                ),
                
                Column(
                children: [
                  Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:Container(
                      height: 60,
                    child: ElevatedButton(
                      style: buttonnoti,
                      onPressed: () {
                        // Handle the first button press
                        print('Button 1 Pressed');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, 
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                                  Icon(Icons.female, color: brown,),
                                  Text('ออกกำลังกาย',
                                    style: TextStyles.login,
                                  ),
                      ],
                      ) 
                    ),
                  ),
                  ),
                ],
              ),

               SizedBox(
                  height: 10,
                ),
                
                Column(
                children: [
                  Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:Container(
                      height: 60,
                    child: ElevatedButton(
                      style: buttonnoti,
                      onPressed: () {
                        // Handle the first button press
                        print('Button 1 Pressed');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, 
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                                  Icon(Icons.female, color: brown,),
                                  Text('ออกกำลังกาย',
                                    style: TextStyles.login,
                                  ),
                      ],
                      ) 
                    ),
                  ),
                  ),
                ],
              ),

              SizedBox(
                  height: 10,
                ),
                
                Column(
                children: [
                  Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:Container(
                      height: 60,
                    child: ElevatedButton(
                      style: buttonnoti,
                      onPressed: () {
                        // Handle the first button press
                        print('Button 1 Pressed');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, 
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                                  Icon(Icons.female, color: brown,),
                                  Text('ออกกำลังกาย',
                                    style: TextStyles.login,
                                  ),
                      ],
                      ) 
                    ),
                  ),
                  ),
                ],
              ),

              SizedBox(
                  height: 10,
                ),
                
                Column(
                children: [
                  Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:Container(
                      height: 60,
                    child: ElevatedButton(
                      style: buttonnoti,
                      onPressed: () {
                        // Handle the first button press
                        print('Button 1 Pressed');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, 
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                                  Icon(Icons.female, color: brown,),
                                  Text('ออกกำลังกาย',
                                    style: TextStyles.login,
                                  ),
                      ],
                      ) 
                    ),
                  ),
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
