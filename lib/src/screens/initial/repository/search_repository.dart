import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../design/constants.dart';
import '../model/search_model.dart';

class SearchRepository with ChangeNotifier {
  bool isLoading = false;
  static Dio dio = Dio();

  Future<SearchModel> seaching(String query) async {
    try {
      isLoading = true;
      notifyListeners();
      var response = await dio.get(
        "${Constants.baseUrl}/cargo/track-code/search/",
        queryParameters: {'search': query},
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );
      isLoading = false;
      notifyListeners();

      final cargo = SearchModel.fromJson(response.data['data']);

      return cargo;
    } catch (e) {
      isLoading = false;
      notifyListeners();

      throw Exception('Failed to perform search: $e');
    }
  }
}
