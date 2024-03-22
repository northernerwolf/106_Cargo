import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../application/settings_singleton.dart';
import '../../../design/constants.dart';
import '../model/orders_model.dart';

class SearchProvider with ChangeNotifier {
  bool isLoading = false;
  List<TripModel> orders = [];

  static Dio dio = Dio();

  Future<void> getOrders(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? val = preferences.getString('token');
    orders = [];

    final headers = {
      'Authorization': 'Bearer $val',
    };

    try {
      var response =
          await dio.get("${Constants.baseUrl}/cargo/track-code/search/",
              options: Options(
                headers: headers
                  ..addAll(
                    {
                      'Accept-Language':
                          SettingsSingleton().locale.languageCode,
                    },
                  ),
              ));
      isLoading = true;

      if (response.statusCode == 200) {
        if (response.data != null) {
          orders = List<TripModel>.from(response.data['data'].map((e) {
            return TripModel.fromJson(e);
          }));

          // pointsget = List<Point>.from(response.data['data']['points'].map((e) {
          //   return Point.fromJson(e);
          // }));
          isLoading = false;
          notifyListeners();
        }

        return;
      }
    // ignore: deprecated_member_use
    } on DioError {
      isLoading = true;

      notifyListeners();
    }
    return;
  }
}
