import 'package:dio/dio.dart';

import '../../../design/constants.dart';
import '../model/search_model.dart';

class SearchRepository {
  bool isLoading = false;
  static Dio dio = Dio();

  Future<SearchModel> seaching(String query) async {
    try {
      var response = await dio.get(
        "${Constants.baseUrl}/cargo/track-code/search/",
        queryParameters: {'search': query},
        options: Options(headers: {
          'Content-Type': 'application/json',
        }),
      );
      isLoading = true;

      print(response.data);

      final cargo = SearchModel.fromJson(response.data['data']);

      return cargo;
    } catch (e) {
      isLoading = false;

      throw Exception('Failed to perform search: $e');
    }
  }
}
