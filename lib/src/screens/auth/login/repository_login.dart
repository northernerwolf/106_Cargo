import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../bottom_nav/bottom_nav_screen.dart';
import '../../../design/constants.dart';

class LoginRepository with ChangeNotifier {
  String? tokens;
  bool isLoading = true;
  static Dio dio = Dio();

  Future<void> login(
      BuildContext context, String phone, String password) async {
    try {
      var response = await dio.post(
        "${Constants.baseUrl}/auth/login",
        data: jsonEncode({"phone": phone, "password": password}),
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );
      isLoading = false;
      notifyListeners();
      print(response.data);

      if (response.statusCode == 200) {
        isLoading = true;
        SharedPreferences preferences = await SharedPreferences.getInstance();

        tokens = response.data!['data']['token'];
        await preferences.setString('token', tokens!);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const BottomNavScreen()));
        notifyListeners();
        return;
      } else {
        print(response.statusCode);
      }
    } on DioError catch (e) {
      isLoading = true;
      print('fuckkkkk');
      print(e.response!.statusCode);
      if (e.response != null) print("Error= ${e.response!.realUri}");
      if (e.response != null) print(e.response!.data);
      notifyListeners();
    }
    return;
  }
}

class LogOutRepository {
  bool isLoading = false;
  static Dio dio = Dio();

  Future<void> logOut(
    BuildContext context,
    String tokens,
  ) async {
    final headers = {
      'Authorization': 'Bearer $tokens',
    };
    try {
      var response = await dio.post("${Constants.baseUrl}/auth/logout",
          options: Options(headers: headers));
      isLoading = true;
      print(response.data);
      if (response.statusCode == 200) {
        isLoading = false;
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.remove('token');
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const BottomNavScreen()));

        return;
      }
    } on DioError catch (e) {
      isLoading = false;
      print('fuckkkkk');
      print(e.error);
      if (e.response != null) print("Error= ${e.response!.realUri}");
      if (e.response != null) print(e.response!.data);
    }
    return;
  }
}
