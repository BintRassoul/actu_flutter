import 'package:get/get.dart';
import 'package:my_actu/features/latest_news/presentation/controllers/latest_controller.dart';

class LatestNewsBinding extends Bindings {
  @override
  void dependencies() {
      Get.lazyPut<LatestNewsController>(() => LatestNewsController(),fenix: true);


  }
}