import 'dart:ui';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:my_actu/core/theme/colors.dart';

class AllController extends GetxController {
  RxInt tabIndex = 0.obs;
  Rx<Color> selectedItemColor = AppColors.darkMallow.obs;

  AllController();
//-----------------------------------methods------------------------------------------
  @override
  Future<void> onInit() async {
    super.onInit();
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
}
