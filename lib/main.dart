import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_actu/routes/app_pages.dart';
import 'package:my_actu/services/config_reader.dart';

import 'routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  //await ConfigReader.initialize();

  runApp(MyActuApp());
}

class MyActuApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.LOGO,
      getPages: AppPages.list,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
