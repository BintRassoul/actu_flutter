// To parse this JSON data, do
//
//     final bingNewsModel = bingNewsModelFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

BingNewsModel bingNewsModelFromJson(String str) =>
    BingNewsModel.fromJson(json.decode(str));

String bingNewsModelToJson(BingNewsModel data) => json.encode(data.toJson());

class BingNewsModel {
  String type;
  String readLink;
  QueryContext queryContext;
  int totalEstimatedMatches;
  List<Sort> sort;
  List<Value> value;

  BingNewsModel({
    required this.type,
    required this.readLink,
    required this.queryContext,
    required this.totalEstimatedMatches,
    required this.sort,
    required this.value,
  });

  BingNewsModel copyWith({
    String? type,
    String? readLink,
    QueryContext? queryContext,
    int? totalEstimatedMatches,
    List<Sort>? sort,
    List<Value>? value,
  }) =>
      BingNewsModel(
        type: type ?? this.type,
        readLink: readLink ?? this.readLink,
        queryContext: queryContext ?? this.queryContext,
        totalEstimatedMatches:
            totalEstimatedMatches ?? this.totalEstimatedMatches,
        sort: sort ?? this.sort,
        value: value ?? this.value,
      );

  factory BingNewsModel.fromJson(Map<String, dynamic> json) => BingNewsModel(
        type: json["_type"],
        readLink: json["readLink"],
        queryContext: QueryContext.fromJson(json["queryContext"]),
        totalEstimatedMatches: json["totalEstimatedMatches"],
        sort: List<Sort>.from(json["sort"].map((x) => Sort.fromJson(x))),
        value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_type": type,
        "readLink": readLink,
        "queryContext": queryContext.toJson(),
        "totalEstimatedMatches": totalEstimatedMatches,
        "sort": List<dynamic>.from(sort.map((x) => x.toJson())),
        "value": List<dynamic>.from(value.map((x) => x.toJson())),
      };
}

class Value {
  String name;
  String url;
  ValueImage? image;
  String description;
  List<About>? about;
  List<Mention>? mentions;
  List<Provider> provider;
  DateTime datePublished;
  Category? category;
  File? imageFile;
  int? saveAt;

  Value(
      {required this.name,
      required this.url,
      this.image,
      required this.description,
      this.about,
      this.mentions,
      required this.provider,
      required this.datePublished,
      this.category,
      required this.imageFile,
      required this.saveAt});

  Value copyWith({
    String? name,
    String? url,
    ValueImage? image,
    String? description,
    List<About>? about,
    List<Mention>? mentions,
    List<Provider>? provider,
    DateTime? datePublished,
    Category? category,
  }) =>
      Value(
        name: name ?? this.name,
        url: url ?? this.url,
        image: image ?? this.image,
        description: description ?? this.description,
        about: about ?? this.about,
        mentions: mentions ?? this.mentions,
        provider: provider ?? this.provider,
        datePublished: datePublished ?? this.datePublished,
        category: category ?? this.category,
        imageFile: imageFile ?? this.imageFile,
        saveAt: saveAt ?? this.saveAt,
      );

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        name: json["name"],
        url: json["url"],
        image:
            json["image"] == null ? null : ValueImage.fromJson(json["image"]),
        description: json["description"],
        about: json["about"] == null
            ? []
            : List<About>.from(json["about"]!.map((x) => About.fromJson(x))),
        mentions: json["mentions"] == null
            ? []
            : List<Mention>.from(
                json["mentions"]!.map((x) => Mention.fromJson(x))),
        provider: List<Provider>.from(
            json["provider"].map((x) => Provider.fromJson(x))),
        datePublished: DateTime.parse(json["datePublished"]),
        category: categoryValues.map[json["category"]],
        imageFile: json["imageFile"] ?? null,
        saveAt: json["saveAt"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "image": image?.toJson(),
        "description": description,
        "about": about == null
            ? []
            : List<dynamic>.from(about!.map((x) => x.toJson())),
        "mentions": mentions == null
            ? []
            : List<dynamic>.from(mentions!.map((x) => x.toJson())),
        "provider": List<dynamic>.from(provider.map((x) => x.toJson())),
        "datePublished": datePublished.toIso8601String(),
        "category": categoryValues.reverse[category],
        "imageFile": imageFile,
        "saveAt": saveAt,
      };
}

class About {
  String readLink;
  String name;

  About({
    required this.readLink,
    required this.name,
  });

  About copyWith({
    String? readLink,
    String? name,
  }) =>
      About(
        readLink: readLink ?? this.readLink,
        name: name ?? this.name,
      );

  factory About.fromJson(Map<String, dynamic> json) => About(
        readLink: json["readLink"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "readLink": readLink,
        "name": name,
      };
}

enum Category { SPORTS }

final categoryValues = EnumValues({"Sports": Category.SPORTS});

class ValueImage {
  PurpleThumbnail thumbnail;

  ValueImage({
    required this.thumbnail,
  });

  ValueImage copyWith({
    PurpleThumbnail? thumbnail,
  }) =>
      ValueImage(
        thumbnail: thumbnail ?? this.thumbnail,
      );

  factory ValueImage.fromJson(Map<String, dynamic> json) => ValueImage(
        thumbnail: PurpleThumbnail.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
      };
}

class PurpleThumbnail {
  String contentUrl;
  int width;
  int height;

  PurpleThumbnail({
    required this.contentUrl,
    required this.width,
    required this.height,
  });

  PurpleThumbnail copyWith({
    String? contentUrl,
    int? width,
    int? height,
  }) =>
      PurpleThumbnail(
        contentUrl: contentUrl ?? this.contentUrl,
        width: width ?? this.width,
        height: height ?? this.height,
      );

  factory PurpleThumbnail.fromJson(Map<String, dynamic> json) =>
      PurpleThumbnail(
        contentUrl: json["contentUrl"] ?? "",
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "contentUrl": contentUrl,
        "width": width,
        "height": height,
      };
}

class Mention {
  String name;

  Mention({
    required this.name,
  });

  Mention copyWith({
    String? name,
  }) =>
      Mention(
        name: name ?? this.name,
      );

  factory Mention.fromJson(Map<String, dynamic> json) => Mention(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Provider {
  Type type;
  String name;
  ProviderImage? image;

  Provider({
    required this.type,
    required this.name,
    this.image,
  });

  Provider copyWith({
    Type? type,
    String? name,
    ProviderImage? image,
  }) =>
      Provider(
        type: type ?? this.type,
        name: name ?? this.name,
        image: image ?? this.image,
      );

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        type: typeValues.map[json["_type"]]!,
        name: json["name"],
        image: json["image"] == null
            ? null
            : ProviderImage.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "_type": typeValues.reverse[type],
        "name": name,
        "image": image?.toJson(),
      };
}

class ProviderImage {
  FluffyThumbnail thumbnail;

  ProviderImage({
    required this.thumbnail,
  });

  ProviderImage copyWith({
    FluffyThumbnail? thumbnail,
  }) =>
      ProviderImage(
        thumbnail: thumbnail ?? this.thumbnail,
      );

  factory ProviderImage.fromJson(Map<String, dynamic> json) => ProviderImage(
        thumbnail: FluffyThumbnail.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail.toJson(),
      };
}

class FluffyThumbnail {
  String contentUrl;

  FluffyThumbnail({
    required this.contentUrl,
  });

  FluffyThumbnail copyWith({
    String? contentUrl,
  }) =>
      FluffyThumbnail(
        contentUrl: contentUrl ?? this.contentUrl,
      );

  factory FluffyThumbnail.fromJson(Map<String, dynamic> json) =>
      FluffyThumbnail(
        contentUrl: json["contentUrl"],
      );

  Map<String, dynamic> toJson() => {
        "contentUrl": contentUrl,
      };
}

enum Type { ORGANIZATION }

final typeValues = EnumValues({"Organization": Type.ORGANIZATION});

class QueryContext {
  String originalQuery;
  bool adultIntent;

  QueryContext({
    required this.originalQuery,
    required this.adultIntent,
  });

  QueryContext copyWith({
    String? originalQuery,
    bool? adultIntent,
  }) =>
      QueryContext(
        originalQuery: originalQuery ?? this.originalQuery,
        adultIntent: adultIntent ?? this.adultIntent,
      );

  factory QueryContext.fromJson(Map<String, dynamic> json) => QueryContext(
        originalQuery: json["originalQuery"],
        adultIntent: json["adultIntent"],
      );

  Map<String, dynamic> toJson() => {
        "originalQuery": originalQuery,
        "adultIntent": adultIntent,
      };
}

class Sort {
  String name;
  String id;
  bool isSelected;
  String url;

  Sort({
    required this.name,
    required this.id,
    required this.isSelected,
    required this.url,
  });

  Sort copyWith({
    String? name,
    String? id,
    bool? isSelected,
    String? url,
  }) =>
      Sort(
        name: name ?? this.name,
        id: id ?? this.id,
        isSelected: isSelected ?? this.isSelected,
        url: url ?? this.url,
      );

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
        name: json["name"],
        id: json["id"],
        isSelected: json["isSelected"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "isSelected": isSelected,
        "url": url,
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
