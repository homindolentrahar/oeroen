import 'package:get/get.dart';
import 'package:oeroen/features/iuran/presentation/application/iuran_controller.dart';

class IuranBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IuranController>(() => IuranController());
  }
}
