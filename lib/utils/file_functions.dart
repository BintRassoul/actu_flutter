import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import 'dio_requests.dart';

Future<File>? getFile(String fileName) async {
  Directory docDirectory = await getApplicationDocumentsDirectory();
  File? file = File(path.join(docDirectory.path, path.basename(fileName)));

  return file;
}

Future<File?> saveImage(String url, String fileName) async {
  var response = await dio().get(url,
      queryParameters: null,
      options: Options(responseType: ResponseType.bytes));
  File? file = await getFile(fileName);

  await file!.writeAsBytes(response.data);
  return file;
}

Future<void> removeImage(String fileName) async {
  File? file = await getFile(fileName);
  if (file != null) await file.delete();
}
