import 'dart:convert';

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
