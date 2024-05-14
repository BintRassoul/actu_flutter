import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_actu/features/home/presentation/bindings/home_bindings.dart';
import 'package:my_actu/pages/logo/logo_binding.dart';

class AllBindings {
  init() async {
    await GetStorage.init(); 
    LogoBinding().dependencies();
    HomeBinding().dependencies();
   
  }
}
