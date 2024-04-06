import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../design/constants.dart';
import '../model/search_model.dart';

class SearchProvider with ChangeNotifier {
  bool isLoading = false;
  static Dio dio = Dio();

  Future<SearchModel> seaching(String query) async {
    try {
      isLoading = true;
      notifyListeners();
      const Duration(seconds: 3);
      var response = await dio.get(
        "${Constants.baseUrl}/cargo/track-code/search/",
        queryParameters: {'search': query},
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );

      if (response.data != null) {
        isLoading = false;
      }
      notifyListeners();

      final cargo = SearchModel.fromJson(response.data['data']);
      print(cargo);

      return cargo;
    } catch (e) {
      isLoading = false;
      notifyListeners();

      throw Exception('Failed to perform search: $e');
    }
  }
}
