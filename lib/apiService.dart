// ignore_for_file: avoid_print

import 'dart:convert';
// ignore: unused_import
import 'dart:io';
import 'dart:math';

import 'package:http/http.dart' as http;

import 'package:kotha_new/config.dart';
import 'package:kotha_new/model/login_request_model.dart';
import 'package:kotha_new/model/login_response_model.dart';
import 'package:kotha_new/model/room_model.dart';
import 'package:kotha_new/model/signup_response_model.dart';
import 'package:kotha_new/sharedService.dart';

import 'model/signup_request_model.dart';

class APIService {
  static var client = http.Client();

  // ignore: duplicate_ignore
  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    // var url = Uri.http(Config.apiURL, Config.loginAPI);
    // var url = Uri.parse("${Config.apiURL}${Config.loginAPI}");
    // var url = Uri.parse(Config.apiURL + Config.loginAPI);
    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    // ignore:
    print(response.statusCode);
    // ignore:
    print(response.body);

    if (response.statusCode == 200) {
      //shared
      await SharedService.setLoginDetails(loginResponseJson(response.body));

      return true;
    } else {
      return false;
    }
  }

  static Future<SignupResponseModel> signup(SignupRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.signupAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    // // ignore:
    // print(response.statusCode);
    // print(response.body);

    // var data =  json.decode(response.body);
    // print(data['status']);

    // if (response.statusCode == 200) {
    //   // return response.body;
    // } else {
    //   return "";
    // }
    // return data;

    return signupResponseModel(response.body);
  }

//for room
  static Future<List<RoomModel>?> getRooms() async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.apiURL, Config.RoomAPI);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return roomsFromJson(data("data"));
    } else {
      return null;
    }
  }

  // static Future<bool> saveRoom(
  //   RoomModel model,
  //   bool isEditMode,
  // ) async {
  //   var RoomAPI = Config.RoomAPI;
  //   if (isEditMode) {
  //     RoomAPI = RoomAPI + "/" + model.id.toString();
  //   }
  //   // Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
  //   var url = Uri.http(Config.apiURL, Config.RoomAPI);
  //   var requestMethod = isEditMode ? "PUT" : "POST";
  //   var request = http.MultipartRequest(requestMethod, url);
  //   request.fields["address"] = model.address!;
  //   request.fields["city "] = model.address!;
  //   request.fields["contact"] = model.contact!;
  //   request.fields["address"] = model.country;
  //   request.fields["address"] = model.id;
  //   request.fields["address"] = model.parkingType;
  //   request.fields["address"] = model.postalCode;
  //   request.fields["address"] = model.priceType;
  //   request.fields["address"] = model.roomDescription;
  //   request.fields["address"] = model.state;
  //   request.fields["address"] = model.street;
  //   request.fields["address"] = model.latitude.toString();
  //   request.fields["address"] = model.longitude.toString();
  //   request.fields["address"] = model.price.toString();
  //   request.fields["address"] = model.roomQuantity.toString();
  //   if(model.images != null) {
  // //     List<http.MultipartFile> files = [];
  // //      for (String imagePath in model.images) {
  // //   http.MultipartFile file = await http.MultipartFile.fromPath('Images', imagePath);
  // //   files.add(file);
  // // }

  //     http.MultipartFile multipartFile = await http.MultipartFile.fromPath('Images', model.images!,
  //     );
  //     request.files.add(multipartFile);
  //   }

  //   // var response = await client.get(url, headers: requestHeaders);
  //   var response = await request.send();

  //   if (response.statusCode == 200) {
  //     // var data = jsonDecode(response.body);

  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  static Future<bool> saveRoom(
    RoomModel model,
    bool isEditMode,
  ) async {
    var roomAPI = Config.RoomAPI;
    if (isEditMode) {
      roomAPI = roomAPI + "/" + model.id.toString();
    }

    var url = Uri.http(Config.apiURL, roomAPI);
    var requestMethod = isEditMode ? "PUT" : "POST";
    var request = http.MultipartRequest(requestMethod, url);

    request.fields["address"] = model.address!;
    request.fields["contact"] = model.contact!;
    request.fields["id"] = model.id.toString();
    request.fields["parkingType"] = model.parkingType!;
    request.fields["priceType"] = model.priceType!;
    request.fields["roomDescription"] = model.roomDescription!;
    request.fields["latitude"] = model.latitude.toString();
    request.fields["longitude"] = model.longitude.toString();
    request.fields["price"] = model.price.toString();
    request.fields["roomQuantity"] = model.roomQuantity.toString();

    if (model.images != null) {
      var multipartFiles = <http.MultipartFile>[];
      for (String imagePath in model.images!) {
        var file = await http.MultipartFile.fromPath('Images', imagePath);
        multipartFiles.add(file);
      }
      request.files.addAll(multipartFiles);
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteRoom(roomId) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    var url = Uri.http(Config.apiURL, Config.RoomAPI + "/" + roomId);
    var response = await client.delete(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}







// // ignore_for_file: avoid_print

// import 'dart:convert';
// // ignore: unused_import
// import 'dart:io';
// import 'dart:math';

// import 'package:dio/dio.dart';
// import 'package:flutter/src/widgets/editable_text.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';

// import 'package:kotha_new/config.dart';
// import 'package:kotha_new/config.dart';
// import 'package:kotha_new/model/login_request_model.dart';
// import 'package:kotha_new/model/login_response_model.dart';
// import 'package:kotha_new/model/newroommodel.dart';
// import 'package:kotha_new/model/room_model.dart';
// import 'package:kotha_new/model/signup_response_model.dart';
// import 'package:kotha_new/sharedService.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'config.dart';
// import 'model/signup_request_model.dart';

// class APIService {
//   static var client = http.Client();

//   // APIService(XFile xFile, Map<String, Object> data, TextEditingController roomDescriptionController);

//   // ignore: duplicate_ignore
//   static Future<bool> login(LoginRequestModel model) async {
//     Map<String, String> requestHeaders = {
//       'Content-Type': 'application/json',
//     };

//     // var url = Uri.http(Config.apiURL, Config.loginAPI);
//     // var url = Uri.parse("${Config.apiURL}${Config.loginAPI}");
//     // var url = Uri.parse(Config.apiURL + Config.loginAPI);
//     var url = Uri.http(Config.baseUrl, Config.loginAPI);

//     var response = await client.post(
//       url,
//       headers: requestHeaders,
//       body: jsonEncode(model.toJson()),
//     );
//     // ignore:
//     print(response.statusCode);
//     // ignore:
//     print(response.body);

//     if (response.statusCode == 200) {
//       //shared
//       await SharedService.setLoginDetails(loginResponseJson(response.body));

//       return true;
//     } else {
//       return false;
//     }
//   }

//   static Future<SignupResponseModel> signup(SignupRequestModel model) async {
//     Map<String, String> requestHeaders = {
//       'Content-Type': 'application/json',
//     };

//     var url = Uri.http(Config.apiURL, Config.signupAPI);

//     var response = await client.post(
//       url,
//       headers: requestHeaders,
//       body: jsonEncode(model.toJson()),
//     );
//     // // ignore:
//     // print(response.statusCode);
//     // print(response.body);

//     // var data =  json.decode(response.body);
//     // print(data['status']);

//     // if (response.statusCode == 200) {
//     //   // return response.body;
//     // } else {
//     //   return "";
//     // }
//     // return data;

//     return signupResponseModel(response.body);
//   }

//   final String url = Uri.http(Config.apiURL, Config.roomAPI).toString();

//   List<RentalRoom> parseRooms(String responseBody) {
//     final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//     return parsed.map<RentalRoom>((json) => RentalRoom.fromJson(json)).toList();
//   }
//   // Future<List<RentalRoom>> fetchRooms() async {
//   //   final response = await http.get(Uri.parse(url));
//   //   if (response.statusCode == 200) {
//   //     return parseRooms(response.body);
//   //   } else {
//   //     throw Exception('Failed to load rooms');
//   //   }
//   // }

//   Future<List<RentalRoom>> getRooms() async {
//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       final jsonData = jsonDecode(response.body);
//       return List<RentalRoom>.from(jsonData.map((x) => RentalRoom.fromJson(x)));
//     } else {
//       throw Exception('Failed to load rooms');
//     }
//   }

//   // List<RentalRoom> parseRooms2(String responseBody) {
//   //   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//   //   return parsed.map<RentalRoom>((json) => RentalRoom.fromJson(json) {
//   //     final city = json['city'];
//   //     final contact = json['contact'];
//   //     final image = json['image'];
//   //     final id = json['id'];
//   //     final price = json['price'];
//   //     final description = json['description'];
//   //     final street = json['street'];
//   //     final priceType = json['priceType'];
//   //     final water = json['water'];
//   //     final electricity = json['electricity'];
//   //     final parking = json['parking'];
//   //     final kitchen = json['kitchen'];
//   //     final wifi = json['wifi'];
//   //     final roomDescription = json['roomDescription'];
//   //     final parkingType = json['parkingType'];
//   //     final roomQuantity = json['roomQuantoty'];
//   //     final age = json['age'];
//   //     final gender = json['gender'];
//   //     final budget = json['budget'];
//   //     final profession = json['profession'];
//   //     final userDescription = json['userDescription'];
//   //     final profilepic = json['profilepic'] as String;
//   //     final images = json['images'] as String;

//   //     String imagesBase64;
//   //     if(images != null && images.isNotEmpty) {
//   //       final imgresponse = http.get(Uri.parse(images));
//   //       final bytes = imgrespone.bodyBytes;
//   //       imageBase64 = base64Encode(bytes);

//   //     }

//   // final String urls = Uri.http(Config.apiURL, Config.postroomAPI).toString();
//   final String endpoint =
//       Uri.http(Config.apiURL, Config.postroomAPI).toString();

//   Future<void> postData(String filename, endpoint, RentalRoom room) async {
//     try {
//       final url = Uri.parse('$endpoint${Config.imgUrl}');
//       var request = http.MultipartRequest('POST', url);

//       request.files.add(
//         http.MultipartFile(
//           'images',
//           File(filename).readAsBytes().asStream(),
//           File(filename).lengthSync(),
//           filename: filename.split("/").last,
//         ),
//       );
//       request.fields['city'] = room.city ?? '';
//       request.fields['price'] = room.price?.toString() ?? '';
//       request.fields['street'] = room.street ?? '';
//       request.fields['priceType'] = room.priceType ?? '';
//       request.fields['water'] = room.water?.toString() ?? '';
//       request.fields['electricity'] = room.electricity?.toString() ?? '';
//       request.fields['parking'] = room.parking?.toString() ?? '';
//       request.fields['kitchen'] = room.kitchen?.toString() ?? '';
//       request.fields['wifi'] = room.wifi?.toString() ?? '';
//       request.fields['roomDescription'] = room.roomDescription ?? '';
//       request.fields['parkingType'] = room.parkingType ?? '';
//       request.fields['roomQuantity'] = room.roomQuantity?.toString() ?? '';
//       request.fields['contact'] = room.contact ?? '';

//       var response = await request.send();

//       if (response.statusCode == 200) {
//         print('Uploaded successful!');
//       } else {
//         print('Upload failed!');
//       }
//     } catch (e) {
//       print('upload error: $e');
//     }
//   }

// //   Future<void> uploadData(String filename, String url, RentalRoom room) async {
// //   var request = http.MultipartRequest('POST', Uri.parse(url));

// //   // Add image file to request
// //   request.files.add(
// //     http.MultipartFile(
// //       'picture',
// //       File(filename).readAsBytes().asStream(),
// //       File(filename).lengthSync(),
// //       filename: filename.split("/").last
// //     )
// //   );

// //   // Add text data to request body
// //   request.fields['city'] = room.city ?? '';
// //   request.fields['price'] = room.price?.toString() ?? '';
// //   request.fields['street'] = room.street ?? '';
// //   request.fields['priceType'] = room.priceType ?? '';
// //   request.fields['water'] = room.water?.toString() ?? '';
// //   request.fields['wifi'] = room.wifi?.toString() ?? '';
// //   request.fields['parking'] = room.parking?.toString() ?? '';
// //   request.fields['kitchen'] = room.kitchen?.toString() ?? '';
// //   request.fields['electricity'] = room.electricity?.toString() ?? '';
// //   request.fields['contact'] = room.contact ?? '';
// //   request.fields['roomDescription'] = room.roomDescription ?? '';
// //   request.fields['parkingType'] = room.parkingType ?? '';
// //   request.fields['roomQuantity'] = room.roomQuantity ?? '';
// //   request.fields['age'] = room.age?.toString() ?? '';
// //   request.fields['gender'] = room.gender ?? '';
// //   request.fields['budget'] = room.budget?.toString() ?? '';
// //   request.fields['profession'] = room.profession ?? '';
// //   request.fields['userDescription'] = room.userDescription ?? '';
// //   request.fields['profilepic'] = room.profilepic ?? '';
// //   request.fields['id'] = room.id ?? '';

// //   var res = await request.send();
// // }

//   // Future<void> postRoom(
//   //   RentalRoom room,
//   // ) async {
//   //   String url = Uri.http(Config.apiURL, Config.postroomAPI).toString();
//   //   Dio dio = new Dio();

//   //   FormData formData = new FormData();
//   //   if (room.images != null) {
//   //     List<File> imageFiles = [];

//   //     for (String image in room.images!) {
//   //       imageFiles.add(File(image));
//   //     }
//   //     for (int i = 0; i < imageFiles.length; i++) {
//   //       formData.files.add(MapEntry(
//   //         "images",
//   //         await MultipartFile.fromFile(imageFiles[i].path,
//   //             filename: imageFiles[i].path.split('/').last),
//   //       ));
//   //     }
//   //   }
//   //   formData.fields.add(MapEntry("city", room.city!));
//   //   formData.fields.add(MapEntry("contact", room.contact!));
//   //   formData.fields.add(MapEntry("price", room.price.toString()));
//   //   formData.fields.add(MapEntry("street", room.street!));
//   //   formData.fields.add(MapEntry("priceType", room.priceType!));
//   //   formData.fields.add(MapEntry("water", room.water.toString()));
//   //   formData.fields.add(MapEntry("electricity", room.electricity.toString()));
//   //   formData.fields.add(MapEntry("parking", room.parking.toString()));
//   //   formData.fields.add(MapEntry("kitchen", room.kitchen.toString()));
//   //   formData.fields.add(MapEntry("wifi", room.wifi.toString()));
//   //   formData.fields.add(MapEntry("roomDescription", room.roomDescription!));
//   //   formData.fields.add(MapEntry("parkingType", room.parkingType!));
//   //   formData.fields.add(MapEntry("roomQuantity", room.roomQuantity.toString()));
//   //   formData.fields.add(MapEntry("age", room.age.toString()));
//   //   formData.fields.add(MapEntry("gender", room.gender!));
//   //   formData.fields.add(MapEntry("budget", room.budget.toString()));
//   //   formData.fields.add(MapEntry("profession", room.profession!));
//   //   formData.fields.add(MapEntry("userDescription", room.userDescription!));
//   //   formData.fields.add(MapEntry("profilepic", room.profilepic!));
//   //   formData.fields.add(MapEntry("id", room.id!));

//   //   try {
//   //     Response response = await dio.post(url, data: formData);
//   //     print(response.data);
//   //   } catch (e) {
//   //     print("error uploading room data: $e");
//   //   }
//   // }

//   // final String urls = Uri.http(Config.apiURL, Config.postroomAPI).toString();

//   // Future<dynamic> postData(urls, dynamic data) async {
//   //   final response = await http.post(urls);
//   //   headers:
//   //   <String, String>{
//   //     'Content-Type': 'application/json; charset=UTF-8',
//   //   };
//   //   body: jsonEncode(data);
//   //   if (response.statusCode == 200) {
//   //     return jsonDecode(response.body);
//   //   } else {
//   //     throw Exception('Failed to load data');
//   //   }
//   // }

//   // Future<dynamic> postData(RentalRoom data) async {
//   //   final String urls = Uri.http(Config.apiURL, Config.postroomAPI).toString();
//   //   var request = http.MultipartRequest('POST', Uri.parse(urls));

//   //   request.headers['Content-Type'] = 'application/json; charset=UTF-8';

//   //   for (var i = 0; i < data.images!.length; i++) {
//   //     var multipartFile =
//   //         await http.MultipartFile.fromPath('images', data.images![i]);
//   //     filename:
//   //     'images$i';
//   //     request.files.add(multipartFile);
//   //   }
//   //   request.fields['city'] = data.city!;
//   //   request.fields['contact'] = data.contact!;
//   //   request.fields['price'] = data.price.toString();
//   //   request.fields['street'] = data.street!;
//   //   request.fields['priceType'] = data.priceType!;
//   //   request.fields['water'] = data.water.toString();
//   //   request.fields['electricity'] = data.electricity.toString();
//   //   request.fields['parking'] = data.parking.toString();
//   //   request.fields['kitchen'] = data.kitchen.toString();
//   //   request.fields['wifi'] = data.wifi.toString();
//   //   request.fields['roomDescription'] = data.roomDescription!;
//   //   request.fields['parkingType'] = data.parkingType!;
//   //   request.fields['roomQuantity'] = data.roomQuantity.toString();

//   //   var response = await request.send();
//   //   var responseData = await response.stream.toBytes();
//   //   var responseString = String.fromCharCodes(responseData);
//   //   if (response.statusCode == 200) {
//   //     return jsonDecode(responseString);
//   //   } else {
//   //     throw Exception('Failed to load data');
//   //   }
//   // }

//   // Future<void> postRoom(RentalRoom room,List<File> images) async {
//   //   var request = http.MultipartRequest('POST', Uri.parse(Config.postroomAPI));

//   //   request.headers['Content-Type'] = 'application/json; charset=UTF-8';

//   // }

//   // Future<void> postData() {
//   //   var urls = Uri.http(Config.apiURL, Config.postroomAPI).toString();
//   //   try{
//   //     List<String> imagesbytes = _imageFile!.readAsBytesSync().map((e) => e.toString()).toList();
//   //   }
//   // }
// }
