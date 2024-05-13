import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_actu/features/commun/presentation/bindings/all_bindings.dart';
import 'package:my_actu/routes/app_pages.dart';

import 'routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AllBindings().init();
 // await GetStorage.init();
  //await ConfigReader.initialize();

  runApp(MyActuApp());
}

class MyActuApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.LOGO,
      getPages:appRoutes,
     // initialBinding: AllBindings(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
