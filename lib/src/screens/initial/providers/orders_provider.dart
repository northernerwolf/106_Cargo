import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kargo_app/src/application/settings_singleton.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../design/constants.dart';
import '../model/orders_model.dart';

class OrdersProvider with ChangeNotifier {
  bool isLoading = false;
  bool waiting = false;
  List<TripModel> orders = [];
  List<TripModel> pointsget = [];

  static Dio dio = Dio();

  Future<void> getOrders() async {
    isLoading = true;
    notifyListeners();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? val = preferences.getString('token');
    print(val);
    orders = [];
    pointsget = [];
    final headers = {
      'Authorization': 'Bearer $val',
    };

    try {
      var response = await dio.get(
        "${Constants.baseUrl}/cargo/list",
        options: Options(
          headers: headers
            ..addAll(
              {
                'Accept-Language': SettingsSingleton().locale.languageCode,
              },
            ),
        ),
      );

      print(response.data);
      if (response.statusCode == 200) {
        if (response.data != null) {
          orders = List<TripModel>.from(response.data['data'].map((e) {
            return TripModel.fromJson(e);
          }));
          isLoading = false;
          for (var item in orders) {
            if (item.points != null) {
              pointsget.add(item);
            }
          }
          // pointsget = List<Point>.from(response.data['data']['points'].map((e) {
          //   return Point.fromJson(e);
          // }));
          isLoading = false;
          notifyListeners();
        }

        return;
      }
    } on DioError catch (e) {
      isLoading = false;
      print('fuckkkkk');
      print(e.error);
      if (e.response != null) print("Error= ${e.response!.realUri}");
      if (e.response != null) print(e.response!.data);

      notifyListeners();
    }
    return;
  }
}
