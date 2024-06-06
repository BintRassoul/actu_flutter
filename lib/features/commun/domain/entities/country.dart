import 'dart:ui';

import 'package:equatable/equatable.dart';

class Country extends Equatable {
  Country(
      {required this.name,
      required this.code,
      this.continent,
      this.isFiltered,
      this.colors});

  final String name;
  final String code;
  final String? continent;
  final bool? isFiltered;
  final List<Color>? colors;

  Country copyWith(
      {String? name,
      String? code,
      String? continent,
      bool? isFiltered,
      List<Color>? colors}) {
    return Country(
      name: name ?? this.name,
      continent: continent ?? this.continent,
      code: code ?? this.code,
      isFiltered: isFiltered ?? this.isFiltered,
      colors: colors ?? this.colors,
    );
  }

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json["name"],
      continent: json["continent"],
      code: json["code"],
      isFiltered: json["isFiltered"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "continent": continent,
        "code": code,
        "isFiltered": isFiltered,
      };

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "name": name,
      "continent": continent,
      "code": code,
      "isFiltered": isFiltered,
      "colors": colors,
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      name: map['name'] as String,
      continent: map['continent'] as String,
      code: map['code'] as String,
      isFiltered: map['isFiltered'] as bool,
      colors: map['colors'] as List<Color>,
    );
  }

  @override
  String toString() {
    return "$name, $code, $isFiltered, ";
  }

  @override
  List<Object?> get props => [
        name,
        code,
      ];
}
