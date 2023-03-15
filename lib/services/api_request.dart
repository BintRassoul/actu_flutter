import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:permission_handler/permission_handler.dart';
import '../models/top_headlines.dart';
import 'package:path/path.dart' as path;

import '../utils/dio_requests.dart';

class ApiRequest {
  final String url;
  final Map<String, dynamic>? data;

  ApiRequest(
    this.data, {
    required this.url,
  });

  Future<List<Article>> getData() async {
    try {
      var response = await dio().get(this.url, queryParameters: this.data);

      print(response.data.toString());
      return TopHeadLines.fromJson(response.data).articles;
    } on DioError catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  /*  Future<File> getImage(String filename) async {
    PermissionStatus _permissionStatus = await Permission.storage.status;
    if (_permissionStatus != PermissionStatus.granted) {
      PermissionStatus permissionStatus = await Permission.storage.request();
      _permissionStatus = permissionStatus;
    }

    try {
      var response = await _dio().get<List<int>>(this.url,
          queryParameters: this.data,
          options: Options(responseType: ResponseType.bytes));

      print(response.data.toString());

      final File file = File(filename);
      if (_permissionStatus == PermissionStatus.granted) {
        file.writeAsBytesSync(response.data!);
      }

      return file;
    } on DioError catch (e) {
      print(e.toString());
      rethrow;
    }
  }
 */
}
