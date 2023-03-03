import 'dart:async';

import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeController extends GetxController {
  RxBool hasInternet = false.obs;
  late StreamSubscription internetSubscription;

  @override
  void onInit() {
    this.internetSubscription =
        InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;
      this.hasInternet.value = hasInternet;
    });
    super.onInit();
  }

//-------------------------------------------------------
  @override
  void onClose() {
    internetSubscription.cancel();
    print('---------CLOSE-connection-------');
  }
//-------------------------------------------------------

}
