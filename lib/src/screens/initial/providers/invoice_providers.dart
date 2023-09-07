import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../application/settings_singleton.dart';
import '../../../design/constants.dart';
import '../model/invoice_model.dart';

class InvoiceProvider with ChangeNotifier {
  bool isLoading = false;
  Shipment? invoice;

  static Dio dio = Dio();

  Future<void> getInvoice(int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? val = preferences.getString('token');
    isLoading = true;
    final headers = {
      'Authorization': 'Bearer $val',
    };

    try {
      var response = await dio.get("${Constants.baseUrl}/cargo/invoice/$id",
          options: Options(
            headers: headers
              ..addAll(
                {
                  'Accept-Language': SettingsSingleton().locale.languageCode,
                },
              ),
          ));
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
      isLoading = false;

      if (e.response != null) print(e.response!.data);

      notifyListeners();
    }
    return;
  }
}
