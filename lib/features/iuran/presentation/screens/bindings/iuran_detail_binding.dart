import 'package:get/get.dart';
import 'package:oeroen/features/iuran/presentation/application/iuran_detail_controller.dart';

class IuranDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IuranDetailController>(() => IuranDetailController());
  }
}
