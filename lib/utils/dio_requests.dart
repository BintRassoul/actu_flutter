import 'package:dio/dio.dart';

Dio dio() {
  // Put your authorization token here
  return Dio(BaseOptions(headers: {
    'Authorization': 'B ....',
  }));
}
