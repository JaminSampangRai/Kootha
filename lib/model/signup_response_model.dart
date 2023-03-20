// import 'dart:convert';

// import 'package:flutter_chat_ui/flutter_chat_ui.dart';

import 'dart:convert';

SignupResponseModel signupResponseModel(String str) =>
    SignupResponseModel.fromJson(json.decode(str));

// class SignupResponseModel {
//   late User? user;
//   late String? token;
//   late int? status;

//   SignupResponseModel({required this.user, token});

//   SignupResponseModel.fromJson(Map<String, dynamic> json) {
//     //this is the first one

//     // user = (json['user'] != null ? User.fromJson(json['user']) : null)!;

//     // user = json['user'] != null ? User.fromJson(json['user']) : null;
//     // user = json.containsKey('user') ? User.fromJson(json['user']) : null;

//     //
//     // if (json.containsKey('user')) {
//     //   user = User.fromJson(json['user']);
//     // }
//     //
//     // token = json['token'] != null ? json['token'] : '';

//     //  user = json.containsKey('user') ? User.fromJson(json['user']) : null;
//     // token = json['token'];
//     // token = json.containsKey('token') ? json['token'] : null;
//     // token = json['token']?.toString().isNotEmpty == true ? json['token'] : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['user'] = user?.toJson();
//     data['token'] = token;
//     data['status'] = status;
//     return data;
//   }
// }

// class User {
//   late String name;
//   late String email;
//   late String password;
//   late String sId;
//   late String createdAt;
//   late String updatedAt;
//   late int iV;

//   User(
//       {required this.name,
//       required this.email,
//       required this.password,
//       required this.sId,
//       required this.createdAt,
//       required this.updatedAt,
//       required this.iV});

//   User.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     email = json['email'];
//     password = json['password'];
//     sId = json['_id'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['name'] = name;
//     data['email'] = email;
//     data['password'] = password;
//     data['_id'] = sId;
//     data['createdAt'] = createdAt;
//     data['updatedAt'] = updatedAt;
//     data['__v'] = iV;
//     return data;
//   }
// }

//below is the new one

class SignupResponseModel {
  SignupResponseModel({
    required this.user,
    // required this.token,
    required this.status,
  });
  late final User? user;
  // late final String token;
  late final int status;

  SignupResponseModel.fromJson(Map<String, dynamic> json) {
    // user = User.fromJson(json['user']);
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    // token = json['token'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user!.toJson();
    // _data['token'] = token;
    _data['status'] = status;
    return _data;
  }
}

class User {
  User({
    required this.name,
    required this.email,
    required this.password,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String name;
  late final String email;
  late final String password;
  late final String id;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    id = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['password'] = password;
    _data['_id'] = id;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}
