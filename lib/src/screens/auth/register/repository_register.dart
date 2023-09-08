import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../bottom_nav/bottom_nav_screen.dart';
import '../../../design/constants.dart';

class RegisterRepository with ChangeNotifier {
  String? tokens;
  bool isLoading = false;
  static Dio dio = Dio();

  Future<void> register(
    BuildContext context,
    String firstName,
    String lastName,
    String phone,
    String password,
    String passwordConfirmation,
  ) async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    try {
      var response = await dio.post(
        "${Constants.baseUrl}/auth/register",
        data: jsonEncode({
          "first_name": firstName,
          "last_name": lastName,
          "phone": phone,
          "password": password,
          "password_confirmation": passwordConfirmation
        }),
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      isLoading = false;

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

        return;
      }
    } on DioError catch (e) {
      isLoading = false;
      if (e.response != null) {
        print(e.response.toString());

        var snackBar = SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              e.response!.data['message'],
              style: const TextStyle(color: Colors.white),
            ));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
    isLoading = false;
    return;
  }
}
