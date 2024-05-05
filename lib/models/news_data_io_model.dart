// To parse this JSON data, do
//
//     final newsDataIo = newsDataIoFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

import 'package:equatable/equatable.dart';

NewsDataIo newsDataIoFromJson(String str) =>
    NewsDataIo.fromJson(json.decode(str));

String newsDataIoToJson(NewsDataIo data) => json.encode(data.toJson());

class NewsDataIo {
  String status;
  int totalResults;
  List<Result> results;
  String nextPage;

  NewsDataIo({
    required this.status,
    required this.totalResults,
    required this.results,
    required this.nextPage,
  });

  NewsDataIo copyWith({
    String? status,
    int? totalResults,
    List<Result>? results,
    String? nextPage,
  }) =>
      NewsDataIo(
        status: status ?? this.status,
        totalResults: totalResults ?? this.totalResults,
        results: results ?? this.results,
        nextPage: nextPage ?? this.nextPage,
      );

  factory NewsDataIo.fromJson(Map<String, dynamic> json) => NewsDataIo(
        status: json["status"],
        totalResults: json["totalResults"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        nextPage: json["nextPage"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "nextPage": nextPage,
      };
}

class Result extends Equatable {
  final String title;
  final String link;
  final List<String>? keywords;
  final List<String>? creator;
  final dynamic videoUrl;
  final String description;
  final String? content;
  final DateTime pubDate;
  final String? imageUrl;
  final String sourceId;
  final List<Category> category;
  final List<Country> country;
  final Language language;
  late final File? imageFile;
  late final int? saveAt;

  Result(
      {required this.title,
      required this.link,
      this.keywords,
      this.creator,
      this.videoUrl,
      required this.description,
      this.content,
      required this.pubDate,
      this.imageUrl,
      required this.sourceId,
      required this.category,
      required this.country,
      required this.language,
      this.imageFile,
      this.saveAt});

  Result copyWith(
          {String? title,
          String? link,
          List<String>? keywords,
          List<String>? creator,
          dynamic videoUrl,
          String? description,
          String? content,
          DateTime? pubDate,
          String? imageUrl,
          String? sourceId,
          List<Category>? category,
          List<Country>? country,
          Language? language,
          File? imageFile,
          int? saveAt}) =>
      Result(
          title: title ?? this.title,
          link: link ?? this.link,
          keywords: keywords ?? this.keywords,
          creator: creator ?? this.creator,
          videoUrl: videoUrl ?? this.videoUrl,
          description: description ?? this.description,
          content: content ?? this.content,
          pubDate: pubDate ?? this.pubDate,
          imageUrl: imageUrl ?? this.imageUrl,
          sourceId: sourceId ?? this.sourceId,
          category: category ?? this.category,
          country: country ?? this.country,
          language: language ?? this.language,
          imageFile: imageFile ?? this.imageFile,
          saveAt: saveAt ?? this.saveAt);

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        link: json["link"],
        keywords: json["keywords"] == null
            ? []
            : List<String>.from(json["keywords"]!.map((x) => x)),
        creator: json["creator"] == null
            ? []
            : List<String>.from(json["creator"]!.map((x) => x)),
        videoUrl: json["video_url"] ?? "",
        description: json["description"] ?? "",
        content: json["content"] ?? "",
        pubDate: DateTime.parse(json["pubDate"]),
        imageUrl: json["image_url"] ?? "",
        sourceId: json["source_id"] ?? "",
        category: json["category"] == null
            ? []
            : List<Category>.from(
                json["category"].map((x) => categoryValues.map[x]!)),
        country: json["country"] == null
            ? []
            : List<Country>.from(json["country"]
                .map((x) => countryValues.map[x.toString().toLowerCase()]!)),
        language: languageValues.map[json["language"]]!,
        imageFile: json["imageFile"] ?? null,
        saveAt: json["saveAt"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "keywords":
            keywords == null ? [] : List<dynamic>.from(keywords!.map((x) => x)),
        "creator":
            creator == null ? [] : List<dynamic>.from(creator!.map((x) => x)),
        "video_url": videoUrl,
        "description": description,
        "content": content,
        "pubDate": pubDate.toIso8601String(),
        "image_url": imageUrl,
        "source_id": sourceId,
        "category":
            List<dynamic>.from(category.map((x) => categoryValues.reverse[x])),
        "country":
            List<dynamic>.from(country.map((x) => countryValues.reverse[x])),
        "language": languageValues.reverse[language],
        "imageFile": imageFile,
        "saveAt": saveAt,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        title,
        link,
        keywords,
        creator,
        videoUrl,
        description,
        content,
        pubDate,
        imageUrl,
        sourceId,
        category,
        country,
        language,
        imageFile,
        saveAt
      ];
}

enum Category {
  BUSINESS,
  ENTERTAINMENT,
  ENVIRONMENT,
  FOOD,
  HEALTH,
  POLITICS,
  SCIENCE,
  SPORTS,
  TECHNOLOGY,
  TOP,
  TOURISM,
  WORLD,
}

final categoryValues = EnumValues({
  "business": Category.BUSINESS,
  "entertainment": Category.ENTERTAINMENT,
  "environment": Category.ENVIRONMENT,
  "food": Category.FOOD,
  "health": Category.HEALTH,
  "politics": Category.POLITICS,
  "science": Category.SCIENCE,
  "sports": Category.SPORTS,
  "technology": Category.TECHNOLOGY,
  "top": Category.TOP,
  "tourism": Category.TOURISM,
  "world": Category.WORLD,
});

enum Country {
  AFGHANISTAN,
  ALBANIA,
  ALGERIA,
  ANGOLA,
  ARGENTINA,
  AUSTRALIA,
  AUSTRIA,
  AZERBAIJAN,
  BAHRAIN,
  BANGLADESH,
  BARBADOS,
  BELARUS,
  BELGIUM,
  BERMUDA,
  BHUTAN,
  BOLIVIA,
  BOSNIA_AND_HERZEGOVINA,
  BRAZIL,
  BRUNEI,
  BULGARIA,
  BURKINA_FASCO,
  CAMBODIA,
  CAMEROON,
  CANADA,
  CAPE_VERDE,
  CAYMAN_ISLANDS,
  CHILE,
  CHINA,
  COLOMBIA,
  COMOROS,
  COSTA_RICA,
  COTE_D_IVOIRE,
  CROATIA,
  CUBA,
  CYPRUS,
  CZECH_REPUBLIC,
  DENMARK,
  DJIBOUTI,
  DOMINICA,
  DOMINICAN_REPUBLIC,
  DR_CONGO,
  ECUADOR,
  EGYPT,
  EL_SALVADOR,
  ESTONIA,
  ETHIOPIA,
  FIJI,
  FINLAND,
  FRANCE,
  FRENCH_POLYNESIA,
  GABON,
  GEORGIA,
  GERMANY,
  GHANA,
  GREECE,
  GUATEMALA,
  GUINEA,
  HAITI,
  HONDURAS,
  HONG_KONG,
  HUNGARY,
  ICELAND,
  INDIA,
  INDONESIA,
  IRAQ,
  IRELAND,
  ISRAEL,
  ITALY,
  JAMAICA,
  JAPAN,
  JORDAN,
  KAZAKHSTAN,
  KENYA,
  KUWAIT,
  KYRGYZSTAN,
  LATVIA,
  LEBANON,
  LIBYA,
  LITHUANIA,
  LUXEMBOURG,
  MACAU,
  MACEDONIA,
  MADAGASCAR,
  MALAWI,
  MALAYSIA,
  MALDIVES,
  MALI,
  MALTA,
  MAURITANIA,
  MEXICO,
  MOLDOVA,
  MONGOLIA,
  MONTENEGRO,
  MOROCCO,
  MOZAMBIQUE,
  MYANMAR,
  NAMIBIA,
  NEPAL,
  NETHERLAND,
  NEW_ZEALAND,
  NIGER,
  NIGERIA,
  NORTH_KOREA,
  NORWAY,
  OMAN,
  PAKISTAN,
  PANAMA,
  PARAGUAY,
  PERU,
  PHILIPPINES,
  POLAND,
  PORTUGAL,
  PUERTO_RICO,
  ROMANIA,
  RUSSIA,
  RWANDA,
  SAMOA,
  SAN_MARINO,
  SAUDI_ARABIA,
  SENEGAL,
  SERBIA,
  SINGAPORE,
  SLOVAKIA,
  SLOVENIA,
  SOLOMON_ISLANDS,
  SOMALIA,
  SOUTH_AFRICA,
  SOUTH_KOREA,
  SPAIN,
  SRI_LANKA,
  SUDAN,
  SWEDEN,
  SWITZERLAND,
  SYRIA,
  TAIWAN,
  TAJIKISTAN,
  TANZANIA,
  THAILAND,
  TONGA,
  TUNISIA,
  TURKEY,
  TURKMENISTAN,
  UGANDA,
  UKRAINE,
  UNITED_ARAB_EMIRATES,
  UNITED_KINGDOM,
  UNITED_STATES_OF_AMERICA,
  URUGUAY,
  UZBEKISTAN,
  VENEZUELA,
  VIETNAM,
  YEMEN,
  ZAMBIA,
  ZIMBABWE
}

final countryValues = EnumValues({
  "afghanistan": Country.AFGHANISTAN,
  "albania": Country.ALBANIA,
  "algeria": Country.ALGERIA,
  "angola": Country.ANGOLA,
  "argentina": Country.ARGENTINA,
  "australia": Country.AUSTRALIA,
  "austria": Country.AUSTRIA,
  "azerbaijan": Country.AZERBAIJAN,
  "bahrain": Country.BAHRAIN,
  "bangladesh": Country.BANGLADESH,
  "barbados": Country.BARBADOS,
  "belarus": Country.BELARUS,
  "belgium": Country.BELGIUM,
  "bermuda": Country.BERMUDA,
  "bhutan": Country.BHUTAN,
  "bolivia": Country.BOLIVIA,
  "bosnia And Herzegovina": Country.BOSNIA_AND_HERZEGOVINA,
  "brazil": Country.BRAZIL,
  "bunei": Country.BRUNEI,
  "bulgaria": Country.BULGARIA,
  "burkina fasco": Country.BURKINA_FASCO,
  "cambodia": Country.CAMBODIA,
  "cameroon": Country.CAMEROON,
  "canada": Country.CANADA,
  "cape Verde": Country.CAPE_VERDE,
  "cayman Islands": Country.CAYMAN_ISLANDS,
  "chile": Country.CHILE,
  "china": Country.CHINA,
  "colombia": Country.COLOMBIA,
  "comoros": Country.COMOROS,
  "costa Rica": Country.COSTA_RICA,
  "côte d'Ivoire": Country.COTE_D_IVOIRE,
  "croatia": Country.CROATIA,
  "cuba": Country.CUBA,
  "cyprus": Country.CYPRUS,
  "czech republic": Country.CZECH_REPUBLIC,
  "denmark": Country.DENMARK,
  "djibouti": Country.DJIBOUTI,
  "dominica": Country.DOMINICA,
  "dominican republic": Country.DOMINICAN_REPUBLIC,
  "dr Congo": Country.DR_CONGO,
  "ecuador": Country.ECUADOR,
  "egypt": Country.EGYPT,
  "el Salvador": Country.EL_SALVADOR,
  "estonia": Country.ESTONIA,
  "ethiopia": Country.ETHIOPIA,
  "fiji": Country.FIJI,
  "finland": Country.FINLAND,
  "france": Country.FRANCE,
  "french Polynesia": Country.FRENCH_POLYNESIA,
  "gabon": Country.GABON,
  "georgia": Country.GEORGIA,
  "germany": Country.GERMANY,
  "ghana": Country.GHANA,
  "greece": Country.GREECE,
  "guatemala": Country.GUATEMALA,
  "guinea": Country.GUINEA,
  "haiti": Country.HAITI,
  "honduras": Country.HONDURAS,
  "hong kong": Country.HONG_KONG,
  "hungary": Country.HUNGARY,
  "iceland": Country.ICELAND,
  "india": Country.INDIA,
  "indonesia": Country.INDONESIA,
  "iraq": Country.IRAQ,
  "ireland": Country.IRELAND,
  "israel": Country.ISRAEL,
  "italy": Country.ITALY,
  "jamaica": Country.JAMAICA,
  "japan": Country.JAPAN,
  "jordan": Country.JORDAN,
  "kazakhstan": Country.KAZAKHSTAN,
  "kenya": Country.KENYA,
  "kuwait": Country.KUWAIT,
  "kyrgyzstan": Country.KYRGYZSTAN,
  "latvia": Country.LATVIA,
  "lebanon": Country.LEBANON,
  "libya": Country.LIBYA,
  "lithuania": Country.LITHUANIA,
  "luxembourg": Country.LUXEMBOURG,
  "macau": Country.MACAU,
  "macedonia": Country.MACEDONIA,
  "madagascar": Country.MADAGASCAR,
  "malawi": Country.MALAWI,
  "malaysia": Country.MALAYSIA,
  "maldives": Country.MALDIVES,
  "mali": Country.MALI,
  "malta": Country.MALTA,
  "mauritania": Country.MAURITANIA,
  "mexico": Country.MEXICO,
  "moldova": Country.MOLDOVA,
  "mongolia": Country.MONGOLIA,
  "montenegro": Country.MONTENEGRO,
  "morocco": Country.MOROCCO,
  "mozambique": Country.MOZAMBIQUE,
  "myanmar": Country.MYANMAR,
  "namibia": Country.NAMIBIA,
  "nepal": Country.NEPAL,
  "netherland": Country.NETHERLAND,
  "new zealand": Country.NEW_ZEALAND,
  "niger": Country.NIGER,
  "nigeria": Country.NIGERIA,
  "north korea": Country.NORTH_KOREA,
  "norway": Country.NORWAY,
  "oman": Country.OMAN,
  "pakistan": Country.PAKISTAN,
  "panama": Country.PANAMA,
  "paraguay": Country.PARAGUAY,
  "peru": Country.PERU,
  "philippines": Country.PHILIPPINES,
  "poland": Country.POLAND,
  "portugal": Country.PORTUGAL,
  "puerto rico": Country.PUERTO_RICO,
  "pomania": Country.ROMANIA,
  "pussia": Country.RUSSIA,
  "rwanda": Country.RWANDA,
  "samoa": Country.SAMOA,
  "san Marino": Country.SAN_MARINO,
  "saudi arabia": Country.SAUDI_ARABIA,
  "senegal": Country.SENEGAL,
  "serbia": Country.SERBIA,
  "singapore": Country.SINGAPORE,
  "slovakia": Country.SLOVAKIA,
  "slovenia": Country.SLOVENIA,
  "solomon Islands": Country.SOLOMON_ISLANDS,
  "somalia": Country.SOMALIA,
  "south africa": Country.SOUTH_AFRICA,
  "south korea": Country.SOUTH_KOREA,
  "spain": Country.SPAIN,
  "sri Lanka": Country.SRI_LANKA,
  "sudan": Country.SUDAN,
  "sweden": Country.SWEDEN,
  "switzerland": Country.SWITZERLAND,
  "syria": Country.SYRIA,
  "taiwan": Country.TAIWAN,
  "tajikistan": Country.TAJIKISTAN,
  "tanzania": Country.TANZANIA,
  "thailand": Country.THAILAND,
  "tonga": Country.TONGA,
  "tunisia": Country.TUNISIA,
  "turkey": Country.TURKEY,
  "turkmenistan": Country.TURKMENISTAN,
  "uganda": Country.UGANDA,
  "ukraine": Country.UKRAINE,
  "united arab emirates": Country.UNITED_ARAB_EMIRATES,
  "united kingdom": Country.UNITED_KINGDOM,
  "united states of america": Country.UNITED_STATES_OF_AMERICA,
  "uruguay": Country.URUGUAY,
  "uzbekistan": Country.UZBEKISTAN,
  "venezuela": Country.VENEZUELA,
  "vietnam": Country.VIETNAM,
  "yemen": Country.YEMEN,
  "zambia": Country.ZAMBIA,
  "zimbabwe": Country.ZIMBABWE,
});

enum Language {
  AFRIKAANS,
  ALBANIAN,
  AMHARIC,
  ARABIC,
  AZERBAIJANI,
  BELARUSIAN,
  BENGALI,
  BOSNIAN,
  BULGARIAN,
  BURMESE,
  CENTRAL_KURDISH,
  CHINESE,
  CROATIAN,
  CZECH,
  DANISH,
  DUTCH,
  ENGLISH,
  ESTONIAN,
  FILIPINO,
  FINNISH,
  FRENCH,
  GEORGIAN,
  GERMAN,
  GREEK,
  HEBREW,
  HINDI,
  HUNGARIAN,
  ICELANDIC,
  INDONESIAN,
  ITALIAN,
  JAPANESE,
  KHMER,
  KINYARWANDA,
  KOREAN,
  LATVIAN,
  LITHUANIAN,
  LUXEMBOURGISH,
  MACEDONIAN,
  MALAY,
  MALTESE,
  MAORI,
  MONGOLIAN,
  NEPALI,
  NORWEGIAN,
  PASHTO,
  PERSIAN,
  POLISH,
  PORTUGUESE,
  ROMANIAN,
  RUSSIAN,
  SAMOAN,
  SERBIAN,
  SHONA,
  SINHALA,
  SLOVAK,
  SLOVENIAN,
  SOMALI,
  SPANISH,
  SWAHILI,
  SWEDISH,
  TAJIK,
  TAMIL,
  THAI,
  TURKISH,
  TURKMEN,
  UKRAINIAN,
  URDU,
  UZBEK,
  VIETNAMESE,
}

final languageValues = EnumValues({
  "afrikaans": Language.AFRIKAANS,
  "albanian": Language.ALBANIAN,
  "amharic": Language.AMHARIC,
  "arabic": Language.ARABIC,
  "azerbaijani": Language.AZERBAIJANI,
  "belarusian": Language.BELARUSIAN,
  "bengali": Language.BENGALI,
  "bosnian": Language.BOSNIAN,
  "bulgarian": Language.BULGARIAN,
  "burmese": Language.BURMESE,
  "central kurdish": Language.CENTRAL_KURDISH,
  "chinese": Language.CHINESE,
  "croatian": Language.CROATIAN,
  "czech": Language.CZECH,
  "danish": Language.DANISH,
  "dutch": Language.DUTCH,
  "english": Language.ENGLISH,
  "estonian": Language.ESTONIAN,
  "filipino": Language.FILIPINO,
  "finnish": Language.FINNISH,
  "french": Language.FRENCH,
  "georgian": Language.GEORGIAN,
  "german": Language.GERMAN,
  "greek": Language.GREEK,
  "hebrew": Language.HEBREW,
  "hindi": Language.HINDI,
  "hungarian": Language.HUNGARIAN,
  "icelandic": Language.ICELANDIC,
  "indonesian": Language.INDONESIAN,
  "italian": Language.ITALIAN,
  "japanese": Language.JAPANESE,
  "khmer": Language.KHMER,
  "kinyarwanda": Language.KINYARWANDA,
  "korean": Language.KOREAN,
  "latvian": Language.LATVIAN,
  "lithuanian": Language.LITHUANIAN,
  "luxembourgish": Language.LUXEMBOURGISH,
  "macedonian": Language.MACEDONIAN,
  "malay": Language.MALAY,
  "maltese": Language.MALTESE,
  "maori": Language.MAORI,
  "mongolian": Language.MONGOLIAN,
  "nepali": Language.NEPALI,
  "norwegian": Language.NORWEGIAN,
  "pashto": Language.PASHTO,
  "persian": Language.PERSIAN,
  "polish": Language.POLISH,
  "portuguese": Language.PORTUGUESE,
  "romanian": Language.ROMANIAN,
  "russian": Language.RUSSIAN,
  "samoan": Language.SAMOAN,
  "serbian": Language.SERBIAN,
  "shona": Language.SHONA,
  "sinhala": Language.SINHALA,
  "slovak": Language.SLOVAK,
  "slovenian": Language.SLOVENIAN,
  "somali": Language.SOMALI,
  "spanish": Language.SPANISH,
  "swahili": Language.SWAHILI,
  "swedish": Language.SWEDISH,
  "tajik": Language.TAJIK,
  "tamil": Language.TAMIL,
  "thai": Language.THAI,
  "turkish": Language.TURKISH,
  "turkmen": Language.TURKMEN,
  "ukrainian": Language.UKRAINIAN,
  "urdu": Language.URDU,
  "uzbek": Language.UZBEK,
  "vietnamese": Language.VIETNAMESE,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}