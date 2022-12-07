import 'package:get/get.dart';
import 'package:oeroen/core/presentation/application/iuran_list_controller.dart';
import 'package:oeroen/features/iuran/domain/repositories/i_iuran_repository.dart';
import 'package:oeroen/features/iuran/domain/usecases/listen_all_iuran.dart';

class IuranListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IuranListController>(
      () => IuranListController(
        listenAllIuran: ListenAllIuran(Get.find<IIuranRepository>()),
      ),
    );
  }
}
