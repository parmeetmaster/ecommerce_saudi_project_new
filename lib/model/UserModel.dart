// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.firstname,
    this.lastname,
    this.phonenumber,
    this.email,
    this.password,
  });

  String firstname;
  String lastname;
  String phonenumber;
  String email;
  String password;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    firstname: json["firstname"],
    lastname: json["lastname"],
    phonenumber: json["phonenumber"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "phonenumber": phonenumber,
    "email": email,
    "password": password,
  };
}
