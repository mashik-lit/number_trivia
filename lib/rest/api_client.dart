import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'http://numbersapi.com/')
abstract class ApiClient{

  factory ApiClient(Dio dio) {
    return _ApiClient(dio, baseUrl: 'http://numbersapi.com/');
  }

  @GET('{number}')
  @Header('Content-Type: application/json')
  Future<String> getTriviaOf(@Path('number') int number);
}