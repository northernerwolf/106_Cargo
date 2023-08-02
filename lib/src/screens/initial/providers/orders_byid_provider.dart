import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../design/constants.dart';
import '../model/orders_model.dart';

class OrdersByIdProvider with ChangeNotifier {
  bool isLoading = false;
  TripModel? ordersById;

  static Dio dio = Dio();

  Future<void> getOrdersById(int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? val = preferences.getString('token');
    final headers = {
      'Authorization': 'Bearer 2|TKCjFAa5PPccNRBonzTWah3OBSPrPOp6zrwAczXa',
    };

    try {
      var response = await dio.get("${Constants.baseUrl}/cargo/fetch/$id",
          options: Options(headers: headers));
      isLoading = true;
      print(response.data);
      if (response.statusCode == 200) {
        ordersById = TripModel.fromJson(response.data['data']);
        isLoading = false;
        notifyListeners();
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
