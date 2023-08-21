import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../design/constants.dart';
import '../model/invoice_model.dart';
import '../model/orders_model.dart';

class InvoiceProvider with ChangeNotifier {
  bool isLoading = false;
  Shipment? invoice;

  static Dio dio = Dio();

  Future<void> getInvoice(int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? val = preferences.getString('token');

    final headers = {
      'Authorization': 'Bearer $val',
    };

    try {
      var response = await dio.get("${Constants.baseUrl}/cargo/invoice/$id",
          options: Options(headers: headers));
      isLoading = true;
      print(response.data);
      if (response.statusCode == 200) {
        if (response.data != null) {
          invoice = Shipment.fromJson(response.data['data']);

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
