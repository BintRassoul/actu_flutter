import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:my_actu/features/latest_news/presentation/bindings/latest_bindings.dart';
import 'package:my_actu/features/latest_news/presentation/pages/latest_news_page.dart';
import 'package:my_actu/features/latest_news/presentation/route/routes.dart';

final latestRoutes = <GetPage>[
  GetPage(
    name: LatestNewsRoutes.latest,
    // middlewares: [RouteGuard()],
    page: () => LatestNewsPage(),
    binding: LatestNewsBinding(),
    transition: Transition.noTransition,
  ),
];
