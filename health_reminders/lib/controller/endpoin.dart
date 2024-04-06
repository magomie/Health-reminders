import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

//flutter_lib
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/foundation.dart' show Uint8List, kIsWeb;
//firebase_lib
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:health_reminders/controller/plugin.dart';
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

  static Future<String> uploadImageFood(Uint8List _fileBytes) async {
    if (_fileBytes == null) return '';

    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final filePath = 'foods/$fileName.png';

      await FirebaseStorage.instance.ref(filePath).putData(_fileBytes);

      return filePath;
    } catch (error) {
      print('Error uploading image: $error');
      return '';
    }
  }

  static Future<String> uploadImageNews(Uint8List _fileBytes) async {
    if (_fileBytes == null) return '';

    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final filePath = 'news/$fileName.png';

      await FirebaseStorage.instance.ref(filePath).putData(_fileBytes);

      return filePath;
    } catch (error) {
      print('Error uploading image: $error');
      return '';
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

      NotificationServices.scheduleNotification(noti: noti, userId: userId);

      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  static Future<bool> addUserFood(
      String userId, foodDataModel food, String timestamp) async {
    try {
      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      await users.doc(userId).collection('userFood').doc(food.foodId).set(
        {
          ...food.toMap(),
          'timestamp': timestamp,
          'Status': 'pick',
          'Type': 'food'
        },
      );

      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  static Future<bool> updateUserFoodAndWaterStatus(
      String userId, String Id, String newStatus) async {
    try {
      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      await users
          .doc(userId)
          .collection('userFood')
          .doc(Id)
          .update({'Status': newStatus});

      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  static Future<bool> addUserWater(
      String userId, waterModel water, String timestamp) async {
    try {
      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      await users.doc(userId).collection('userFood').doc(water.waterId).set(
        {
          ...water.toMap(),
          'timestamp': timestamp,
          'Status': 'pick',
          'Type': 'water'
        },
      );

      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  static Future<bool> updateUserWaterStatus(
      String userId, String waterId, String newStatus) async {
    try {
      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      await users
          .doc(userId)
          .collection('userFood')
          .doc(waterId)
          .update({'Status': newStatus});

      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  static Future<bool> addFoodData(foodDataModel foodData) async {
    try {
      final CollectionReference foods =
          FirebaseFirestore.instance.collection('foods');
      await foods.doc(foodData.foodId).set(foodData.toMap());
      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  static Future<bool> addNewsData(NewsDataModel newsDataModel) async {
    try {
      final CollectionReference foods =
          FirebaseFirestore.instance.collection('news');
      await foods.doc(newsDataModel.newsId).set(newsDataModel.toMap());
      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  static Future<double> fetchTotalCalorieForUserToday(String userId) async {
    try {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(now);

      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      final QuerySnapshot userFoodSnapshot = await users
          .doc(userId) // User ID
          .collection('userFood') // Subcollection 'userFood'
          .where('timestamp',
              isEqualTo: formattedDate) // Filter by today's date
          .where('Status', isEqualTo: 'pick') // Filter by status
          .get();

      print(formattedDate);

      double totalCalorie = 0;

      // Loop through each document in the subcollection
      for (QueryDocumentSnapshot doc in userFoodSnapshot.docs) {
        // Extract the 'calorie' field from each document
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        final double calorie =
            data['calorie'] ?? 0; // Default to 0 if 'calorie' is null
        totalCalorie += calorie; // Sum up the calorie values
      }

      return totalCalorie;
    } catch (e) {
      print('Error fetching total calorie for user today: $e');
      return 0;
    }
  }

  static Future<double> fetchTotalSugerForUserToday(String userId) async {
    try {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(now);

      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      final QuerySnapshot userFoodSnapshot = await users
          .doc(userId)
          .collection('userFood')
          .where('timestamp', isEqualTo: formattedDate)
          .where('Status', isEqualTo: 'pick')
          .get();

      double totalSuger = 0;
      for (QueryDocumentSnapshot doc in userFoodSnapshot.docs) {
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        final double suger = data['suger'] ?? 0;
        totalSuger += suger;
      }

      return totalSuger;
    } catch (e) {
      print('Error fetching total calorie for user today: $e');
      return 0;
    }
  }

  static Future<double> fetchTotalFatForUserToday(String userId) async {
    try {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(now);

      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      final QuerySnapshot userFoodSnapshot = await users
          .doc(userId)
          .collection('userFood')
          .where('timestamp', isEqualTo: formattedDate)
          .where('Status', isEqualTo: 'pick')
          .get();

      double totalFat = 0;

      for (QueryDocumentSnapshot doc in userFoodSnapshot.docs) {
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        final double fat = data['fat'] ?? 0;
        totalFat += fat;
      }

      return totalFat;
    } catch (e) {
      print('Error fetching total calorie for user today: $e');
      return 0;
    }
  }

  static Future<double> fetchTotalSodiumForUserToday(String userId) async {
    try {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(now);

      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      final QuerySnapshot userFoodSnapshot = await users
          .doc(userId)
          .collection('userFood')
          .where('timestamp', isEqualTo: formattedDate)
          .where('Status', isEqualTo: 'pick')
          .get();

      double totalSodium = 0;

      for (QueryDocumentSnapshot doc in userFoodSnapshot.docs) {
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        final double sodium = data['sodium'] ?? 0;
        totalSodium += sodium;
      }

      return totalSodium;
    } catch (e) {
      print('Error fetching total calorie for user today: $e');
      return 0;
    }
  }

  static Future<double> fetchTotalWaterForUserToday(String userId) async {
    try {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(now);

      final CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      final QuerySnapshot userFoodSnapshot = await users
          .doc(userId) // User ID
          .collection('userFood') // Subcollection 'userFood'
          .where('timestamp',
              isEqualTo: formattedDate) // Filter by today's date
          .where('Status', isEqualTo: 'pick') // Filter by status
          .get();

      print(formattedDate);

      double totalAmount = 0;

      // Loop through each document in the subcollection
      for (QueryDocumentSnapshot doc in userFoodSnapshot.docs) {
        // Extract the 'calorie' field from each document
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        final double amount =
            data['amount'] ?? 0; // Default to 0 if 'calorie' is null
        totalAmount += amount; // Sum up the calorie values
      }

      return totalAmount;
    } catch (e) {
      print('Error fetching total calorie for user today: $e');
      return 0;
    }
  }

  static Future<void> updateNotificationStatus(
      String userId, String notificationId, String status) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('Notification')
        .doc(notificationId)
        .update({
      'notiStatus': status,
    });
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
