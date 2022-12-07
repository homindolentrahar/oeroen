import 'package:get/get.dart';
import 'package:oeroen/features/beranda/presentation/application/wajib_iuran_controller.dart';
import 'package:oeroen/features/iuran/domain/repositories/i_iuran_repository.dart';
import 'package:oeroen/features/iuran/domain/usecases/listen_active_iuran.dart';

class WajibIuranBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WajibIuranController>(
      () => WajibIuranController(
        ListenActiveIuran(Get.find<IIuranRepository>()),
      ),
    );
  }
}
