import 'dart:convert';

LoginResponseModel loginResponseJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  late String message;
  late String token;
  late int status;

  LoginResponseModel(
      {required this.message, required this.token, required this.status});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['token'] = token;
    data['status'] = status;
    return data;
  }
}
