import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hexcolor/hexcolor.dart';

final Color mainHexColor = HexColor('#5D1788');
final Color redColor = Color.fromARGB(255, 207, 53, 42);
final Color blackColor = HexColor('#000');
final Color whiteColor = HexColor('#FFFFFF');
final Color iconHexColor = HexColor('#B703FF');
final Color secondColor = mainHexColor.withOpacity(0.16);
final Color greenColor = HexColor('#159980');

final storage = GetStorage();

final width = Get.width;
final height = Get.height;

final double widthHomeCard = 180.0;
final double sizeHomeTitle = 13;
final double sizeHomeLink = 13;
double widthFavCard = 230;
double sizeFavTitle = 22;
double sizeFavLink = 20;

final List<String> categoriesList = [
  "business",
  "entertainment",
  "environment",
  "food",
  "health",
  "politics",
  "science",
  "sports",
  "technology",
  "top",
  "tourism",
  "world",
];

final countriesList = {
  'europe': {
    'France': 'fr',
    'Allemagne': 'de',
    'Royaume-Uni': 'gb',
    'Italie': 'it',
    'Russie': 'ru',
    'Ukraine': 'ua',
    'Turquie': 'tr',
    'Suède': 'se',
    'Grèce': 'gr',
    'Autriche': 'at',
    'Belgique': 'be',
    'Bulgarie': 'bg',
    'Pologne': 'pl',
    'Portugal': 'pt',
    'Roumanie': 'ro',
    'Serbie': 'rs',
    'Suisse': 'ch',
    'Hongrie': 'hg',
    'Irlande': 'ie',
    'Tchekoslovaquie': 'ae',
    'Lituanie': 'lt',
    'Lettonie': 'lv',
    'Pays-Bas': 'nl',
    'Norvège': 'no',
    'Nouvelle-Zélande': 'nz',
    'Slovénie': 'si',
    'Slovaquie': 'sk',
  },
  'amerique': {
    'USA': 'us',
    'Argentine': 'ar',
    'Bresil': 'br',
    'Canada': 'ca',
    'Colombie': 'co',
    'Mexique': 'mx',
    'Cuba': 'cu',
    'Venezuela': 've',
  },
  'asie': {
    'Arabie Saoudite': 'sa',
    'Chine': 'cn',
    'EAU': 'ae',
    'Hong Kong': 'hk',
    'Japon': 'jp',
    'Philippines': 'ph',
    'Taiwan': 'tw',
    'Thaïlande': 'th',
    'Singapour': 'sg',
    'Indonesie': 'id',
    'Israel': 'il',
    'Inde': 'in',
    'Australie': 'au',
    'Coree du Sud': 'kr',
  },
  'afrique': {
    'Egypte': 'eg',
    'Afrique du Sud': 'za',
    'Maroc': 'ma',
    'Mozambique': 'mz',
    'Nigeria': 'ng',
  },
};
