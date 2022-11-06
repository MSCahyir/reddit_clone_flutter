import 'dart:io';

import 'package:dio/dio.dart';

class BaseService {
  Dio createDio() {
    Dio dio = Dio();
    dio.options.baseUrl = "https://www.reddit.com/r/flutterdev";

    return dio;
  }
}
