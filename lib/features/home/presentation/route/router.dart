import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:my_actu/features/home/presentation/bindings/home_bindings.dart';
import 'package:my_actu/features/home/presentation/pages/home_page.dart';
import 'package:my_actu/features/home/presentation/route/routes.dart';

final homeRoutes = <GetPage>[
  GetPage(
    name: HomeRoutes.home,
    // middlewares: [RouteGuard()],
    page: () => HomePage(),
    binding: HomeBinding(),
    transition: Transition.noTransition,
  ),
];
