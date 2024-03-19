import 'dart:async';
import 'dart:io';

//flutter_lib
import 'package:flutter/material.dart';
//firebase_lib
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
//views
import 'package:health_reminders/views/Home/home.dart';
//page_transittion_lib
import 'package:page_transition/page_transition.dart';

//import_model
import 'package:health_reminders/model/mode.dart';

class APIEndpoint {
  static Future<bool> signIn(
      BuildContext context, String email, String password) async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      QuerySnapshot userQuery = await _firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (userQuery.docs.isNotEmpty) {
        // ครีนี้คือครีของเจ้าของอีเมลนี้
        String userId = userQuery.docs.first['userId'];

        print('userId $userId');

        Navigator.pushReplacement(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: homePage(
              userId: userId,
            ),
          ),
        );

        return true;

        // ส่ง userId ไปยังหน้า homePage หรือทำอย่างอื่นต่อไปได้ตามต้องการ
      } else {
        // ไม่พบข้อมูลผู้ใช้สำหรับอีเมลนี้
        print('ไม่พบข้อมูลผู้ใช้สำหรับอีเมลนี้');
        return false;
      }
    } on Exception catch (e) {
      // TODO
      print("signIn Err : $e");
      return false;
    }
  }

  static Future<bool?> signUp(
      BuildContext context, String email, String password) async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;

      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      return true;
    } on Exception catch (e) {
      // TODO
      print("signUp Err : $e");
      return null;
    }
  }

  static Future<String> uploadImageToFirebase(File? imageFile) async {
    if (imageFile == null) {
      return ''; // หรือสิ่งที่คุณต้องการในกรณีที่ไม่มีภาพ
    }

    try {
      // กำหนด path ใน Firebase Storage ที่ต้องการเก็บรูปภาพ
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('userImage/$fileName');

      // Upload รูปภาพไปยัง Firebase Storage
      UploadTask uploadTask = firebaseStorageRef.putFile(imageFile!);

      // เมื่อ Upload เสร็จสิ้น
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

      // รับ URL ของรูปภาพที่ Upload เสร็จสิ้น
      String imageUrl = await taskSnapshot.ref.getDownloadURL();
      // หรือส่ง URL กลับไปให้ตัวแอปแสดงผล
      return imageUrl;
    } catch (e) {
      print(e);
      // หรือทำการ handle error ตามต้องการ
      return 'error';
    }
  }

  static Future<bool> addUser(String uid, String email, String password) async {
    try {
      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set({'email': email, 'password': password, 'username': ''});

      return true;
    } on Exception catch (e) {
      // TODO
      print("Error: $e");
      return false;
    }
  }

  static Future<bool> addInfo(
      UserModel user, HealthDataModel healthData) async {
    try {
      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      // Add user basic info
      await users
          .doc(user.userId)
          .update({'userId': user.userId, 'username': user.username});

      // Add user health data
      await users
          .doc(user.userId)
          .collection('health_data')
          .doc(user.userId)
          .set(healthData.toMap());

      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  static Future<bool> addNoti(String userId, NotiModel noti) async {
    try {
      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      // Add user health data
      await users
          .doc(userId)
          .collection('Notification')
          .doc(noti.notiId)
          .set(noti.toMap());

      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  static Future<bool> addFood(foodDataModel foodData) async {
    try {
      final CollectionReference users =
          FirebaseFirestore.instance.collection('Food');

      await users.add(foodData.toMap());

      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  static Future<Stream<DocumentSnapshot<Map<String, dynamic>>>> getUserData(
      String userId) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots();
  }

  static Future<Stream<DocumentSnapshot<Map<String, dynamic>>>> getHealthData(
      String userId) async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('health_data')
        .doc(userId)
        .snapshots();
  }

  static Future<bool> signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch (e) {
      // TODO
      print("Error: $e");
      return false;
    }
  }
}
