import 'package:get/get.dart';
import 'package:oeroen/features/beranda/presentation/application/main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
  }
}
