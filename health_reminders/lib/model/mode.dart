import 'dart:convert';

class User {
  final int id;
  final String username;
  final String password;
  final String Type;

  User({required this.id, required this.username, required this.password , required this.Type});

  factory User.formJson(Map<String, dynamic> json) {
    return User(
        id: json['id'], username: json['username'], password: json['password'],Type: json['Type']);
  }
}


