import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import '../api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  var dio = Dio();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  login(data) async {
    bool response = false;
    final SharedPreferences prefs = await _prefs;
    try {
      var result = await dio.post(
        '${baseUrl}login/',
        data: data,
      );
      var decodedData = result.data;

      if (decodedData['status'] == 200) {
        response = true;
        prefs.setString('user', jsonEncode(decodedData['user']));
        prefs.setString('token', jsonEncode(decodedData['token']));
      }
    } on DioError catch (err) {
      print('error aayo');
      print(err.error);
      response = false;
    }
    return response;
  }

  profile(data) async {
    bool response = false;
    final SharedPreferences prefs = await _prefs;
    try {
      var result = await dio.get(
        '${baseUrl}profile/',
        data: data,
      );
      var decodedData = result.data;
      //print(decodedData);
      if (decodedData['status'] == 200) {
        response = true;
        prefs.setString('profile', jsonEncode(decodedData['profile']));
      }
    } on DioError catch (err) {
      print('error aayo');
      print(err.error);
      response = false;
    }
    return response;
  }

  register(data) async {
    dynamic response;
    try {
      var result = await dio.post(
        '${baseUrl}register/',
        data: data,
      );
      var decodedData = result.data;
      print(decodedData);
      if (decodedData['status'] == 200) {
        response = 200;
      } else if (decodedData['status'] == 401) {
        response = 402;
      } else if (decodedData['status'] == 401) {
        response = 401;
      }
    } on DioError catch (err) {
      response = 400;
      print('error aayo');
      print(err);
    }
    return response;
  }

  getAllrooms() async {
    dynamic response;
    try {
      final SharedPreferences prefs = await _prefs;
      var result = await dio.get('${baseUrl}get-all-room');
      var data = result.data;
      if (data['status'] == 200) {
        response = data['data'];
      } else {
        response = false;
      }
    } on DioError catch (_) {
      response = false;
    } catch (e) {
      response = false;
    }
    return response;
  }
}
