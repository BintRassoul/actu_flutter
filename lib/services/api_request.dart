import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/real_time_news_data_model.dart';

class ApiRequest {
  final String url;
  final Map<String, dynamic>? data;

  ApiRequest(
    this.data, {
    required this.url,
  });

  static Future<List<Datum>?> fetchAlbum(
      String uri, Map<String, String>? headers) async {
    try {
      final response = await http.get(Uri.parse(uri), headers: headers);

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        log("Connection to API is quite!!!");
        String json = response.body;

        log("---length of articles--- : " +
            realTimeNewsDataModelFromJson(json).data.length.toString());
        log(json);
        List<Datum> articles = realTimeNewsDataModelFromJson(json).data;
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
