import 'package:get/get.dart';
import 'package:my_actu/features/home/presentation/route/router.dart';
import 'package:my_actu/pages/logo/logo_page.dart';

import '../pages/logo/logo_binding.dart';
import 'app_routes.dart';


  final appRoutes = <GetPage>[
 
   GetPage(
      name: AppRoutes.LOGO,
      page: () => LogoPage(),
      binding: LogoBinding(),
    ),  
     ...homeRoutes,
   /*   GetPage(
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
    ), */
  ];

