import 'dart:io';

//flutter_lib
import 'package:flutter/material.dart';
//firebase_lib
import 'package:cloud_firestore/cloud_firestore.dart';

//endpoin and views
import 'package:health_reminders/controller/endpoin.dart';
import 'package:health_reminders/views/Admin/admin_add_food.dart';
import 'package:health_reminders/views/AppMenu/notification/showNotiScreen.dart';
import 'package:health_reminders/views/Home/home.dart';
import 'package:health_reminders/views/Intro/gender_screen.dart';
import 'package:health_reminders/controller/plugin.dart';
import 'package:health_reminders/views/Intro/landing_screen.dart';

//page_transittion_lib
import 'package:page_transition/page_transition.dart';

//import_model
import 'package:health_reminders/model/mode.dart';

class UserOperator {
  static Future<bool> login(
      BuildContext context, String email, String password) async {
    final bool success = await APIEndpoint.signIn(context, email, password);
    return success;
  }

  static Future<void> newSignUp(BuildContext context, String email,
      String password, String passwordConf) async {
    try {
      if (password == passwordConf) {
        String userid = await userPlugin.generateId('users', 'user');
        if (userid != null) {
          bool? addSuccess = await APIEndpoint.addUser(userid, email, password);
          if (addSuccess != false) {
            bool? success = await APIEndpoint.signUp(context, email, password);

            if (success == true) {
              Navigator.pushReplacement(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: genderPage(
                    userId: userid,
                    email: email,
                    password: password,
                  ),
                ),
              );
            }
          }
        }
      } else {}
    } on Exception catch (e) {
      print("err : $e");
    }
  }

  static Future<void> addFood(
    BuildContext context,
    File? image_File,
    String name_food,
    double calorie,
    double fat,
    double suger,
    double sudium,
  ) async {
    String foodid = await userPlugin.generateId('foods', 'food');
    String image = await APIEndpoint.uploadImageToFirebase(image_File);

    foodDataModel foodData = foodDataModel(
        foodId: foodid,
        image_flie: image,
        name_food: name_food,
        calorie: calorie,
        fat: fat,
        suger: suger,
        sudium: sudium);

    final success = await APIEndpoint.addFood(foodData);

    if (success) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.leftToRight,
          child: admin_add_foodPage(),
        ),
      );
    }
  }

  static Future<void> addInfo(
      BuildContext context,
      String userId,
      String email,
      String password,
      File? image_File,
      String username,
      String gender,
      int age,
      double weight,
      double height,
      int Exe_B) async {
    String image = await APIEndpoint.uploadImageToFirebase(image_File);

    UserModel user = UserModel(
      userId: userId,
      email: '',
      password: '',
      username: username,
    );

    HealthDataModel healthData = HealthDataModel(
      userId: userId,
      image_flie: image,
      gender: gender,
      age: age,
      weight: weight,
      height: height,
      exerciseLevel: Exe_B,
    );

    final success = await APIEndpoint.addInfo(user, healthData);

    final bool successLoc = await APIEndpoint.signIn(context, email, password);

    if (success && successLoc) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: homePage(
            userId: userId,
          ),
        ),
      );
    }
  }

  static Future<void> addNoti(
    BuildContext context,
    String userId,
    String labelNotiText,
    String titleNoti,
    String title,
    String note,
    DateTime selectedDate,
    TimeOfDay selectedTime,
  ) async {
    String id = await userPlugin.generateNotiId(userId);

    NotiModel notiModel = NotiModel(
        notiId: id,
        title: title,
        note: note,
        selectedDate: selectedDate,
        selectedTime: selectedTime,
        notiStatus: 'active',
        notiStatusLabel: titleNoti);

    final success = await APIEndpoint.addNoti(userId, notiModel);

    if (success) {
      Navigator.pop(
        context,
        PageTransition(
          type: PageTransitionType.leftToRight,
          child: showNotiScreen(
            userId: userId,
            labelNotiText: labelNotiText,
            titleNoti: titleNoti,
          ),
        ),
      );
    }
  }

  static Future<void> logOut(BuildContext context) async {
    final success = await APIEndpoint.signOut(context);

    if (success != false) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: MyLandingScreen(),
        ),
      );
    }
  }

  static Future<Future<Stream<DocumentSnapshot<Map<String, dynamic>>>>>
      getUserData(String userId) async {
    return APIEndpoint.getUserData(userId);
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getNoti(String userId) {
    return APIEndpoint.getNoti(userId);
  }

  static Future<Future<Stream<DocumentSnapshot<Map<String, dynamic>>>>>
      getHealthData(String userId) async {
    return APIEndpoint.getHealthData(userId);
  }
}
