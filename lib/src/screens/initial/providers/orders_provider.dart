import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../design/constants.dart';
import '../model/orders_model.dart';

class OrdersProvider with ChangeNotifier {
  bool isLoading = false;
  List<TripModel> orders = [];

  static Dio dio = Dio();

  Future<void> getOrders() async {
    orders = [];
    final headers = {
      'Authorization': 'Bearer 2|TKCjFAa5PPccNRBonzTWah3OBSPrPOp6zrwAczXa',
    };

    try {
      var response = await dio.get("${Constants.baseUrl}/cargo/list",
          options: Options(headers: headers));
      isLoading = true;
      print(response.data);
      if (response.statusCode == 200) {
        orders = List<TripModel>.from(response.data['data'].map((e) {
          return TripModel.fromJson(e);
        }));

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
