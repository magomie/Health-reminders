import 'dart:convert';

class User {
  final int id;
  final String email;
  final String password;
  final String Type;

  User(
      {required this.id,
      required this.email,
      required this.password,
      required this.Type});

  factory User.formJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        email: json['mail'],
        password: json['password'],
        Type: json['Type']);
  }
}
