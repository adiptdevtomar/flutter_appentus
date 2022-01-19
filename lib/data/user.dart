// Created by Adipt on 17/01/2022

import 'dart:typed_data';

class User {
  String email;
  String name;
  String password;
  String phone;
  Uint8List image;

  User({
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
    required this.image,
  });

  factory User.fromMap(dynamic obj) => User(
        name: obj['name'],
        password: obj['password'],
        email: obj['email'],
        phone: obj['phone'],
        image: obj['image'],
      );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['email'] = email;
    map['name'] = name;
    map['password'] = password;
    map['phone'] = phone;
    map['image'] = image;
    return map;
  }

  @override
  String toString() {
    return '$name $email $phone';
  }
}
