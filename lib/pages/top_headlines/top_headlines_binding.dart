import 'package:get/get.dart';

import 'top_headlines_controller.dart';

class TopHeadlinesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopHeadLinesController>(() => TopHeadLinesController());
  }
}
