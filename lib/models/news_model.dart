// To parse this JSON data, do
//
//     final newsMediaStack = newsMediaStackFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

NewsMediaStack newsMediaStackFromJson(String str) =>
    NewsMediaStack.fromJson(json.decode(str));

String newsMediaStackToJson(NewsMediaStack data) => json.encode(data.toJson());

class NewsMediaStack {
  NewsMediaStack({
    required this.pagination,
    required this.data,
  });

  Pagination pagination;
  List<Article> data;

  NewsMediaStack copyWith({
    required Pagination pagination,
    required List<Article> data,
  }) =>
      NewsMediaStack(
        pagination: pagination,
        data: data,
      );

  factory NewsMediaStack.fromJson(Map<String, dynamic> json) => NewsMediaStack(
        pagination: Pagination.fromJson(json["pagination"]),
        data: List<Article>.from(json["data"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Article {
  Article(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.source,
      required this.image,
      required this.category,
      required this.language,
      required this.country,
      required this.publishedAt,
      required this.imageFile,
      required this.saveAt});

  String author;
  String title;
  String description;
  String url;
  String source;
  String? image;
  String category;
  String language;
  String country;
  DateTime publishedAt;
  File? imageFile;
  int? saveAt;

  Article copyWith({
    required String author,
    required String title,
    required String description,
    required String url,
    required String source,
    required String image,
    required String category,
    required String language,
    required String country,
    required DateTime publishedAt,
  }) =>
      Article(
        author: author,
        title: title,
        description: description,
        url: url,
        source: source,
        image: image,
        category: category,
        language: language,
        country: country,
        publishedAt: publishedAt,
        imageFile: imageFile,
        saveAt: saveAt,
      );

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        author: json["author"] ?? "",
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        url: json["url"] ?? "",
        source: json["source"] ?? "",
        image: json["image"] ?? "",
        category: json["category"] ?? "",
        language: json["language"] ?? "",
        country: json["country"] ?? "",
        publishedAt: DateTime.parse(json["published_at"]),
        imageFile: json["imageFile"] ?? null,
        saveAt: json["saveAt"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "source": source,
        "image": image,
        "category": category,
        "language": language,
        "country": country,
        "published_at": publishedAt.toIso8601String(),
        "imageFile": imageFile,
        "saveAt": saveAt,
      };
}

/* enum Category { SPORTS, GENERAL }

final categoryValues =
    EnumValues({"general": Category.GENERAL, "sports": Category.SPORTS});

enum Country { US }

final countryValues = EnumValues({"us": Country.US});

enum Language { EN }

final languageValues = EnumValues({"en": Language.EN}); */

class Pagination {
  Pagination({
    required this.limit,
    required this.offset,
    required this.count,
    required this.total,
  });

  int limit;
  int offset;
  int count;
  int total;

  Pagination copyWith({
    required int limit,
    required int offset,
    required int count,
    required int total,
  }) =>
      Pagination(
        limit: limit,
        offset: offset,
        count: count,
        total: total,
      );

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        limit: json["limit"],
        offset: json["offset"],
        count: json["count"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "limit": limit,
        "offset": offset,
        "count": count,
        "total": total,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
