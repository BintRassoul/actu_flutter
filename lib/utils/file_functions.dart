import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

Future<File>? getFile(String fileName) async {
  Directory docDirectory = await getApplicationDocumentsDirectory();
  File? file = File(path.join(docDirectory.path, path.basename(fileName)));

  return file;
}

Future<File?> saveImage(String url, String fileName) async {
  var response = await http.readBytes(Uri.parse(
      url)); /*  http.get(url,
      queryParameters: null,
      options: Options(responseType: ResponseType.bytes)); */
  File? file = await getFile(fileName);

//await file!.writeAsBytes(response.data);
  await file!.writeAsBytes(response);
  return file;
}

Future<void> removeImage(String fileName) async {
  File? file = await getFile(fileName);
  if (file != null) await file.delete();
}
