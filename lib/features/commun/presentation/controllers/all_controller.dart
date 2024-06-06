import 'dart:developer';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:my_actu/constants/app_constants.dart';
import 'package:my_actu/core/theme/colors.dart';
import 'package:my_actu/features/commun/domain/entities/country.dart';

class AllController extends GetxController {
  RxInt tabIndex = 0.obs;
  Rx<Color> selectedItemColor = AppColors.darkMallow.obs;
  RxList<Country> countriesListFiltered = RxList();
  RxList<Country> africaCountriesList = RxList();
  RxList<Country> americaCountriesList = RxList();
  RxList<Country> europeCountriesList = RxList();
  RxList<Country> asiaCountriesList = RxList();

  AllController();
//-----------------------------------methods------------------------------------------
  @override
  Future<void> onInit() async {
    super.onInit();
    if (countriesListFiltered.isNotEmpty) countriesListFiltered.clear();
    africaCountriesList.value = countriesList['afrique']!.entries.map((e) {
      Country cc = Country(
          name: e.key,
          continent: 'afrique',
          code: e.value,
          isFiltered: false,
          colors: [AppColors.white, AppColors.black]);
      log('country ${cc.toString()}');
      return cc;
    }).toList();
    americaCountriesList.value = countriesList['amerique']!.entries.map((e) {
      Country cc = Country(
          name: e.key,
          continent: 'amerique',
          code: e.value,
          isFiltered: false,
          colors: [AppColors.white, AppColors.black]);
      log('country ${cc.toString()}');
      return cc;
    }).toList();
    europeCountriesList.value = countriesList['europe']!.entries.map((e) {
      Country cc = Country(
          name: e.key,
          continent: 'europe',
          code: e.value,
          isFiltered: false,
          colors: [AppColors.white, AppColors.black]);
      // log('country ${cc.toString()}');
      return cc;
    }).toList();
    asiaCountriesList.value = countriesList['asie']!.entries.map((e) {
      Country cc = Country(
          name: e.key,
          continent: 'asie',
          code: e.value,
          isFiltered: false,
          colors: [AppColors.white, AppColors.black]);
      //    log('country ${cc.toString()}');
      return cc;
    }).toList();
  }

  //----------------------------------
  void changeTabIndex(int indexTab) {
    tabIndex.value = indexTab;
  }
  //----------------------------------

  Color getTabIndexColor({int? inputIndex}) {
    if (tabIndex.value == inputIndex) {
      return selectedItemColor.value = AppColors.darkMallow;
    }

    // log('-----------------is NotIn index');

    return selectedItemColor.value = AppColors.darkGray;
  }

  //----------------------------------
  void filterByCountry(String countryName, String continent) {
    switch (continent) {
      case "afrique":
        africaCountriesList = filter(countryName, africaCountriesList);
        break;
      case "amerique":
        americaCountriesList = filter(countryName, americaCountriesList);
        break;
      case "europe":
        europeCountriesList = filter(countryName, europeCountriesList);
        break;
      case "asie":
        asiaCountriesList = filter(countryName, asiaCountriesList);
        break;
    }
  }

  filter(String countryName, List<Country> list) {
    Country country = list.firstWhere((country) => country.name == countryName);
    //log("country before $country");

    int index = list.indexOf(country);
    final bool isFiltered = country.isFiltered!;
    country = isFiltered
        ? country.copyWith(
            isFiltered: false, colors: [AppColors.white, AppColors.black])
        : country.copyWith(
            isFiltered: true, colors: [AppColors.darkMallow, AppColors.white]);

    list.replaceRange(index, index + 1, [country]);
    bool isAlreadyFiltered = countriesListFiltered.contains(country);
    isAlreadyFiltered
        ? countriesListFiltered.remove(country)
        : countriesListFiltered.add(country);

    return list;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
