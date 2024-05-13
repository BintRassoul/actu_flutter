import 'package:get/get.dart';

import 'logo_controller.dart';

class LogoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogoController>(() => LogoController());
    //Get.lazyPut<HomeController>(() => HomeController());
    //Get.lazyPut<TopHeadLinesController>(() => TopHeadLinesController());
   // Get.lazyPut<FavoritesController>(() => FavoritesController());
   // Get.lazyPut<DetailsController>(() => DetailsController());
  }
}
