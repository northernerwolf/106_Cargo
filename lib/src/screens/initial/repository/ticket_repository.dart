import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../bottom_nav/bottom_nav_screen.dart';
import '../../../design/constants.dart';

class TicketsRepository {
  String? tokens;
  bool isLoading = false;
  static Dio dio = Dio();

  Future<void> tickedId(BuildContext context, int id) async {
    try {
      var response = await dio.post(
        "${Constants.baseUrl}/cargo/add/ticket/$id",
        // data: jsonEncode({"phone": phone, "password": password}),
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );
      isLoading = true;
      print(response.data);
      if (response.statusCode == 200) {
        isLoading = false;

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
