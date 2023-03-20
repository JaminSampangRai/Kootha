import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api.dart';

class Postrepository {
  var dio = Dio();
  // var api = APIService.;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  uploadImage(data, images) async {
    final SharedPreferences prefs = await _prefs;

    FormData formData = FormData.fromMap(data);
    var token = prefs.getString('token');
    var jsonDecodedToken = jsonDecode(token!);
    for (var el in images) {
      formData.files.add(MapEntry(
        'images',
        await MultipartFile.fromFile(el.path,
            filename: el.path.split('/').last),
      ));
    }
    try {
      var response = await dio.post('${baseUrl}add-room',
          data: formData,
          options: Options(headers: {'x-access-token': jsonDecodedToken}));
      var result = response.data;
      print(result);
      if (result['status'] == 200) {
        return true;
      }
    } on DioError catch (_) {
      print(_.message);
      return false;
    }
  }

  updateRoom(data, images, id) async {
    final SharedPreferences prefs = await _prefs;

    FormData formData = FormData.fromMap(data);
    var token = prefs.getString('token');
    var jsonDecodedToken = jsonDecode(token!);
    for (var el in images) {
      formData.files.add(MapEntry(
        'images',
        await MultipartFile.fromFile(el.path,
            filename: el.path.split('/').last),
      ));
    }
    try {
      var response = await dio.post('${baseUrl}edit-room/$id',
          data: formData,
          options: Options(headers: {'x-access-token': jsonDecodedToken}));
      var result = response.data;
      print(result);
      if (result['status'] == 200) {
        return true;
      }
    } on DioError catch (_) {
      print(_.message);
      return false;
    }
  }

  getUserRooms() async {
    final SharedPreferences prefs = await _prefs;
    var userDetails = prefs.getString('user');
    var jsonDecodedUserDetail = jsonDecode(userDetails!);
    var userId = jsonDecodedUserDetail['id'];
    var token = prefs.getString('token');
    var jsonDecodedToken = jsonDecode(token!);
    try {
      var response = await dio.get('${baseUrl}get-post-room',
          options: Options(headers: {'x-access-token': jsonDecodedToken}));
      var result = response.data;
      if (result['status'] == 200) {
        return result['data'];
      }
    } on DioError catch (_) {
      print('Error:$_');
      return false;
    }
  }

  getMyFavourites() async {
    final SharedPreferences prefs = await _prefs;
    var userDetails = prefs.getString('user');
    var jsonDecodedUserDetail = jsonDecode(userDetails!);
    var userId = jsonDecodedUserDetail['id'];
    var token = prefs.getString('token');
    var jsonDecodedToken = jsonDecode(token!);
    try {
      var response = await dio.get('${baseUrl}get-post-room',
          options: Options(headers: {'x-access-token': jsonDecodedToken}));
      var result = response.data;
      if (result['status'] == 200) {
        return result['data'];
      }
    } on DioError catch (_) {
      print('Error:$_');
      return false;
    }
  }

  deleteRoom(id) async {
    final SharedPreferences prefs = await _prefs;
    var token = prefs.getString('token');
    var jsonDecodedToken = jsonDecode(token!);
    try {
      var response = await dio.get('${baseUrl}delete/$id',
          options: Options(headers: {'x-access-token': jsonDecodedToken}));
      var result = response.data;
      if (result['status'] == 200) {
        return true;
      }
    } on DioError catch (_) {
      return false;
    }
  }

  // deleteRoom(id) async {
  //   final SharedPreferences prefs = await _prefs;
  //   var token = prefs.getString('token');
  //   var jsonDecodedToken = jsonDecode(token!);
  //   try {
  //     var response = await dio.get('${baseUrl}delete/$id',
  //         options: Options(headers: {'x-access-token': jsonDecode}));
  //     if (result['status'] == 200) {
  //       return true;
  //     }
  //   } on DioError catch (_) {
  //     return false;
  //   }
  // }
}
