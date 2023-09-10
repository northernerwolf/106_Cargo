import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../design/constants.dart';
import '../model/orders_model.dart';

class OrdersProvider with ChangeNotifier {
  bool isLoading = false;
  bool waiting = false;
  List<TripModel> orders = [];
  List<TripModel> pointsget = [];

  static Dio dio = Dio();

  Future<void> getOrders(BuildContext context) async {
    isLoading = true;
    // notifyListeners();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? val = preferences.getString('token');

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
                'Accept-Language': context.locale.languageCode,
              },
            ),
        ),
      );

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

      notifyListeners();
    }
    return;
  }
}
