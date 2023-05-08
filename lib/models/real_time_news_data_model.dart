// To parse this JSON data, do
//
//     final realTimeNewsDataModel = realTimeNewsDataModelFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

RealTimeNewsDataModel realTimeNewsDataModelFromJson(String str) =>
    RealTimeNewsDataModel.fromJson(json.decode(str));

String realTimeNewsDataModelToJson(RealTimeNewsDataModel data) =>
    json.encode(data.toJson());

class RealTimeNewsDataModel {
  String status;
  String requestId;
  List<Datum> data;

  RealTimeNewsDataModel({
    required this.status,
    required this.requestId,
    required this.data,
  });

  RealTimeNewsDataModel copyWith({
    String? status,
    String? requestId,
    List<Datum>? data,
  }) =>
      RealTimeNewsDataModel(
        status: status ?? this.status,
        requestId: requestId ?? this.requestId,
        data: data ?? this.data,
      );

  factory RealTimeNewsDataModel.fromJson(Map<String, dynamic> json) =>
      RealTimeNewsDataModel(
        status: json["status"],
        requestId: json["request_id"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "request_id": requestId,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String title;
  String link;
  String? photoUrl;
  DateTime publishedDatetimeUtc;
  String sourceUrl;
  String? sourceLogoUrl;
  String sourceFaviconUrl;
  List<Datum>? subArticles;
  File? imageFile;
  int? saveAt;
  Datum(
      {required this.title,
      required this.link,
      this.photoUrl,
      required this.publishedDatetimeUtc,
      required this.sourceUrl,
      this.sourceLogoUrl,
      required this.sourceFaviconUrl,
      this.subArticles,
      required this.imageFile,
      required this.saveAt});

  Datum copyWith(
          {String? title,
          String? link,
          String? photoUrl,
          DateTime? publishedDatetimeUtc,
          String? sourceUrl,
          String? sourceLogoUrl,
          String? sourceFaviconUrl,
          List<Datum>? subArticles,
          File? imageFile,
          int? saveAt}) =>
      Datum(
          title: title ?? this.title,
          link: link ?? this.link,
          photoUrl: photoUrl ?? this.photoUrl,
          publishedDatetimeUtc:
              publishedDatetimeUtc ?? this.publishedDatetimeUtc,
          sourceUrl: sourceUrl ?? this.sourceUrl,
          sourceLogoUrl: sourceLogoUrl ?? this.sourceLogoUrl,
          sourceFaviconUrl: sourceFaviconUrl ?? this.sourceFaviconUrl,
          subArticles: subArticles ?? this.subArticles,
          imageFile: imageFile ?? this.imageFile,
          saveAt: saveAt ?? this.saveAt);

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"] ?? "",
        link: json["link"] ?? "",
        photoUrl: json["photo_url"] ?? "",
        publishedDatetimeUtc: DateTime.parse(json["published_datetime_utc"]),
        sourceUrl: json["source_url"] ?? "",
        sourceLogoUrl: json["source_logo_url"] ?? "",
        sourceFaviconUrl: json["source_favicon_url"] ?? "",
        subArticles: json["sub_articles"] == null
            ? []
            : List<Datum>.from(
                json["sub_articles"]!.map((x) => Datum.fromJson(x))),
        imageFile: json["imageFile"] ?? null,
        saveAt: json["saveAt"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "photo_url": photoUrl,
        "published_datetime_utc": publishedDatetimeUtc.toIso8601String(),
        "source_url": sourceUrl,
        "source_logo_url": sourceLogoUrl,
        "source_favicon_url": sourceFaviconUrl,
        "sub_articles": subArticles == null
            ? []
            : List<dynamic>.from(subArticles!.map((x) => x.toJson())),
        "imageFile": imageFile,
        "saveAt": saveAt,
      };
}
