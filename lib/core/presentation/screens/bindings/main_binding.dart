import 'package:get/get.dart';
import 'package:oeroen/core/presentation/application/main_controller.dart';
import 'package:oeroen/features/beranda/presentation/application/beranda_controller.dart';
import 'package:oeroen/features/iuran/domain/repositories/i_iuran_repository.dart';
import 'package:oeroen/features/iuran/domain/usecases/listen_active_iuran.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<BerandaController>(
      () => BerandaController(
        listenActiveIuran: ListenActiveIuran(Get.find<IIuranRepository>()),
      ),
    );
  }
}
