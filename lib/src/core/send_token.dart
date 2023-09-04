import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../design/constants.dart';

class SendFcmTokenRepository {
  bool isLoading = false;
  static Dio dio = Dio();

  Future<void> sendToken(
    String fcmToken,
  ) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? val = preferences.getString('token');

    final headers = {
      'Authorization': 'Bearer $val',
      'Content-Type': 'application/json',
    };
    try {
      var response = await dio.patch(
        "${Constants.baseUrl}/auth/update-token",
        data: jsonEncode({
          "fcm_token": fcmToken,
        }),
        options: Options(
          headers: headers,
        ),
      );
      isLoading = true;

      if (response.statusCode == 200) {
        isLoading = false;

        return;
      }
    } on DioError catch (e) {
      isLoading = false;
    }
    return;
  }
}
