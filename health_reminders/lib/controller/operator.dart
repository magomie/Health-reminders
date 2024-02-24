import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_reminders/controller/endpoin.dart';
import 'package:health_reminders/model/mode.dart';
import 'package:health_reminders/pages/lanrelog/gender.dart';
import 'package:health_reminders/pages/lanrelog/home.dart';
import 'package:health_reminders/pages/lanrelog/landing.dart';
import 'package:page_transition/page_transition.dart';

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
        String userid = await APIEndpoint.generateUserId();
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

  static Future<void> logOut(BuildContext context) async {
    final success = await APIEndpoint.signOut(context);

    if (success != false) {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeft,
          child: landingPage(),
        ),
      );
    }
  }

  static Future<Future<Stream<DocumentSnapshot<Map<String, dynamic>>>>>
      getUserData(String userId) async {
    return APIEndpoint.getUserData(userId);
  }

  static Future<Future<Stream<DocumentSnapshot<Map<String, dynamic>>>>>
      getHealthData(String userId) async {
    return APIEndpoint.getHealthData(userId);
  }
}
