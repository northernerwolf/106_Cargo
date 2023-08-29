import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../application/settings_singleton.dart';
import '../../../design/constants.dart';
import '../model/order_by_id_model.dart';

class GetOrderByIdProvider with ChangeNotifier {
  bool isLoading = false;
  TripDataIdModel? ordersById;

  static Dio dio = Dio();

  Future<void> getOrdersById(int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? val = preferences.getString('token');

    final headers = {
      'Authorization': 'Bearer $val',
    };

    try {
      var response = await dio.get("${Constants.baseUrl}/cargo/fetch/$id",
          options: Options(
            headers: headers
              ..addAll(
                {
                  'Accept-Language': SettingsSingleton().locale.languageCode,
                },
              ),
          ));
      isLoading = true;

      if (response.statusCode == 200) {
        if (response.data != null) {
          ordersById = TripDataIdModel.fromJson(response.data['data']);
        }

        isLoading = false;
        notifyListeners();
        return;
      }
    } on DioError catch (e) {
      isLoading = false;

      if (e.response != null) print(e.response!.data);

      notifyListeners();
    }
    return;
  }
}
