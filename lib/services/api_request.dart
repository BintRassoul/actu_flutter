import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import '../models/top_headlines.dart';
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
      // return NewsMediaStack.fromJson(response.data).data;

      return TopHeadLines.fromJson(response.data).articles;
    } on DioError catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  static Future<List<Article>?> fetchAlbum(String uri) async {
    try {
      final response = await http.get(Uri.parse(uri));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        log("Connection to API is quite!!!");
        String json = response.body;

        List<Article> articles = topHeadLinesFromJson(json).articles;
        log("---length of articles--- : " + articles.length.toString());
        log(json);
        /*  List<Article> articlesWithImages = [];
        articles.forEach(
          (item) {
            if (item.urlToImage != '') articlesWithImages.add(item);
          },
        );
        log("---length of articlesWithImages--- : " +
            articlesWithImages.length.toString());
        // log(articlesWithImages.toString());
 */
        return articles;
      } else if (response.statusCode == 401) {
        log('401: Unauthorized access!!');
      } else if (response.statusCode == 404) {
        log('404 : not connected');
      }
    } on Exception catch (e) {
      log('Exception/ Stack : ' + e.toString());
    }
    return null;
  }
}
