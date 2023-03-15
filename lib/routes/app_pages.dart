import 'package:get/get.dart';
import 'package:my_actu/pages/details/details_page.dart';
import 'package:my_actu/pages/favorites/favorite_page.dart';
import 'package:my_actu/pages/favorites/favorites_binding.dart';
import 'package:my_actu/pages/home/home_page.dart';
import 'package:my_actu/pages/logo/logo_page.dart';

import '../pages/details/datails_binding.dart';
import '../pages/home/home_binding.dart';
import '../pages/logo/logo_binding.dart';
import '../pages/top_headlines/top_headlines_page.dart';
import '../pages/top_headlines/top_headlines_binding.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.LOGO,
      page: () => LogoPage(),
      binding: LogoBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.TOP_HEADLINES,
      page: () => TopHeadLinesPage(),
      binding: TopHeadlinesBinding(),
    ),
    GetPage(
      name: AppRoutes.FAVORITES,
      page: () => FavoritePage(),
      binding: FavoritesBinding(),
    ),
    GetPage(
      name: AppRoutes.DETAILS_NEWS,
      page: () => DetailPage(),
      binding: DetailsBinding(),
    ),
  ];
}
