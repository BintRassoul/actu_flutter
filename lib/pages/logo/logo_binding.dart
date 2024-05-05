import 'package:get/get.dart';
import 'package:my_actu/pages/details/details_controller.dart';
import 'package:my_actu/pages/favorites/favorites_controller.dart';

import '../top_headlines/top_headlines_controller.dart';
import 'logo_controller.dart';
import '../home/home_controller.dart';

class LogoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogoController>(() => LogoController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<TopHeadLinesController>(() => TopHeadLinesController());
    Get.lazyPut<FavoritesController>(() => FavoritesController());
    Get.lazyPut<DetailsController>(() => DetailsController());
  }
}
