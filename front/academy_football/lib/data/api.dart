import 'dart:convert';
import 'package:academy_football/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constant/app_constant.dart';


class Api extends GetConnect implements GetxService  {

  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  Api({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(minutes: 5);
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
    };
  }
  Future<http.Response> getRequest(String url) async {
    try {
      http.Response response = await http.get(
          Uri.parse(url),
          headers: {
            'Authorization': 'Bearer ${sharedPreferences.getString(AppConstants.USER_TOKEN)}',
            'Content-Type': 'application/json',
          });
      //Response response = await get(url);
      print(response.statusCode);
      print(response.body);
      return response;
    } catch (e) {
      print("Error from the api client is " + e.toString());
      return http.Response(e.toString(), 500);
    }
  }

  Future<Response> postRequest(String url, Map data) async {
    try {
      print(json.encode(data));
      Response response = await post(url,data);
      print(response.statusCode);
      print(response.body);
      return response;
    } catch (e) {
      print("Error from the api client is : " + e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
  /*Future postRequest(String url, Map data) async {
    try {
      print("before response");
      print(json.encode(data));
      // if (await CheckInternet()) {
      var response = await http.post(
          Uri.parse(url),
          headers: {
        "Content-type": "application/json"
        },
        body:  json.encode(data));
      print("after response");
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("in api 200");
        Map responsebody = jsonDecode(response.body);
        return response;
      } else {
        print("in api else");
        print("Error : ${response.statusCode}");
      }
    } catch (e) {
      print("catch Error : $e");
    }
  }

  Future getRequest(String url) async {
    try {
      // if (await CheckInternet()) {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Error : ${response.statusCode}");
      }
      // } else {
      //   return print(StatusRequest.offlinefailure);
      // }
    } catch (e) {
      print("catch Error : $e");
    }
  }*/
}