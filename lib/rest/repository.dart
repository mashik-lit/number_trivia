import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'api_client.dart';

final numberRepository = Provider<Repository>((ref) => Repository());

class Repository {
  Dio _dio;
  ApiClient _apiClient;

  Repository() {
    _dio = new Dio();
    _apiClient = new ApiClient(_dio);
  }

  Future<String> getTriviaOf(int number) async {
    final response = await _apiClient.getTriviaOf(number);

    return response;
  }
}
