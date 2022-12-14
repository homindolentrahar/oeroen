import 'package:get/get.dart';
import 'package:oeroen/features/desa/presentation/application/desa_add_controller.dart';

class DesaAddBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DesaAddController>(() => DesaAddController());
  }
}
