import 'package:get/get.dart';
import 'package:my_actu/features/home/presentation/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
      Get.lazyPut<HomeController>(() => HomeController(),fenix: true);


  }
}