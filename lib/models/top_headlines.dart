// To parse this JSON data, do
//
//     final topHeadLines = topHeadLinesFromJson(jsonString);

import 'dart:io';

class TopHeadLines {
  TopHeadLines({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory TopHeadLines.fromJson(Map<String, dynamic> json) => TopHeadLines(
        status: json["status"] ?? "",
        totalResults: json["totalResults"] ?? "",
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );
}

class Article {
  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
    required this.imageFile,
  });

  Source source;
  dynamic author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;
  File? imageFile;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? "",
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        url: json["url"] ?? "",
        urlToImage: json["urlToImage"] ?? "",
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? "",
        imageFile: null,
      );

  /*  Article.fromMap(Map<String, dynamic> map)
      : source = map['source'],
        author = map['author'],
        title = map['title'],
        url = map['url'],
        urlToImage = map['urlToImage'],
        publishedAt = map['publishedAt'],
        content = map['content'];
 */
  Map<String, dynamic> toJson() {
    return {
      "source": source.toJson(),
      "author": author == null ? null : author,
      "title": title,
      "description": description,
      "url": url,
      "urlToImage": urlToImage,
      "publishedAt": publishedAt.toIso8601String(),
      "content": content,
      "imageFile": null,
    };
  }
}

class Source {
  Source({
    this.id,
    required this.name,
  });

  dynamic id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name,
      };
}
