import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/news_data_io_model.dart';

class ApiRequest {
  final String url;
  final Map<String, dynamic>? data;

  ApiRequest(
    this.data, {
    required this.url,
  });

  static Future<List<Result>?> fetchAlbum(
      String uri, Map<String, String>? headers) async {
    //late List<Result> articles;
    final response = await http.get(Uri.parse(uri), headers: headers);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      log("Connection to API is quite!!!");
      String json = response.body;

      log("---length of articles--- : " +
          newsDataIoFromJson(json).results.length.toString());
      log(json);
      List<Result> articles = newsDataIoFromJson(json).results;
      log("---length of articles--- : " + articles.length.toString());

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
      throw Exception('401: Unauthorized access!!');
      // log('401: Unauthorized access!!');
    } else if (response.statusCode == 404) {
      throw Exception('404 : not connected');
//log('404 : not connected');
    }
    // log('Exception/ Stack : ' + e.toString());
    return null;
  }
}
