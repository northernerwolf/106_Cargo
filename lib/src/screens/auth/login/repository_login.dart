import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../bottom_nav/bottom_nav_screen.dart';
import '../../../design/constants.dart';

class LoginRepository with ChangeNotifier {
  String? tokens;
  bool isLoading = false;
  static Dio dio = Dio();
  String? errorMessage;

  Future<void> login(
      BuildContext context, String phone, String password) async {
    isLoading = true;
    try {
      notifyListeners();
      await Future.delayed(const Duration(seconds: 2));
      var response = await dio.post(
        "${Constants.baseUrl}/auth/login",
        data: jsonEncode({"phone": phone, "password": password}),
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      notifyListeners();

      if (response.statusCode == 200) {
        isLoading = false;
        SharedPreferences preferences = await SharedPreferences.getInstance();

        tokens = response.data!['data']['token'];
        await preferences.setString('token', tokens!);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const BottomNavScreen()),
            (route) => false);
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (context) => const BottomNavScreen()));
        notifyListeners();
        return;
      } else {}
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      isLoading = false;

      if (e.response != null) {
        var snackBar = SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              e.response!.data['message'],
              style: const TextStyle(color: Colors.white),
            ));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        notifyListeners();
      }

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

      if (response.statusCode == 200) {
        isLoading = false;
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.remove('token');
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const BottomNavScreen()));

        return;
      }
      // ignore: deprecated_member_use
    } on DioError catch (e) {
      isLoading = false;

      if (e.response != null) print(e.response!.data);
    }
    return;
  }
}
