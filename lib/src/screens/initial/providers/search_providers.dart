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

  Future<void> getOrders() async {
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
      print(response.data);
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
    } on DioError catch (e) {
      isLoading = true;
      print('fuckkkkk');
      print(e.error);
      if (e.response != null) print("Error= ${e.response!.realUri}");
      if (e.response != null) print(e.response!.data);

      notifyListeners();
    }
    return;
  }
}
