import 'package:flutter/material.dart';

// User model
class UserModel {
  final String userId;
  final String email;
  final String password;
  final String username;

  UserModel({
    required this.userId,
    required this.email,
    required this.password,
    required this.username,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'email': email,
      'password': password,
      'name': username,
    };
  }
}

// HealthData model
class HealthDataModel {
  final String userId;
  final String image_flie;
  final String gender;
  final int age;
  final double weight;
  final double height;
  final int exerciseLevel;

  HealthDataModel({
    required this.userId,
    required this.image_flie,
    required this.gender,
    required this.age,
    required this.weight,
    required this.height,
    required this.exerciseLevel,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'image_flie': image_flie,
      'gender': gender,
      'age': age,
      'weight': weight,
      'height': height,
      'exerciseLevel': exerciseLevel,
    };
  }
}

class NotiModel {
  final String notiId;
  final String title;
  final String note;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final String notiStatus;
  final String notiStatusLabel;

  NotiModel({
    required this.notiId,
    required this.title,
    required this.note,
    required this.selectedDate,
    required this.selectedTime,
    required this.notiStatus,
    required this.notiStatusLabel,
  });

  Map<String, dynamic> toMap() {
    return {
      'notiId': notiId,
      'title': title,
      'note': note,
      'selectedDate':
          "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}",
      'selectedTime': "${selectedTime.hour}:${selectedTime.minute}",
      'notiStatus': notiStatus,
      'notiStatusLabel': notiStatusLabel,
    };
  }
}

class foodDataModel {
  final String foodId;
  final String image_file;
  final String name_food;
  final double calorie;
  final double fat;
  final double suger;
  final double sodium;

  foodDataModel({
    required this.foodId,
    required this.image_file,
    required this.name_food,
    required this.calorie,
    required this.fat,
    required this.suger,
    required this.sodium,
  });

  Map<String, dynamic> toMap() {
    return {
      'foodId': foodId,
      'image_file': image_file,
      'name_food': name_food,
      'calorie': calorie,
      'fat': fat,
      'suger': suger,
      'sodium': sodium,
    };
  }
}
