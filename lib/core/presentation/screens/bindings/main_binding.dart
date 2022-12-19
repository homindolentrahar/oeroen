import 'package:get/get.dart';
import 'package:oeroen/core/presentation/application/main_controller.dart';
import 'package:oeroen/features/beranda/presentation/application/beranda_controller.dart';
import 'package:oeroen/features/desa/domain/repositories/i_desa_repository.dart';
import 'package:oeroen/features/desa/domain/usecases/listen_desa.dart';
import 'package:oeroen/features/desa/domain/usecases/listen_transaction_desa.dart';
import 'package:oeroen/features/desa/presentation/application/desa_controller.dart';
import 'package:oeroen/features/iuran/domain/repositories/i_iuran_repository.dart';
import 'package:oeroen/features/iuran/domain/usecases/listen_active_iuran.dart';
import 'package:oeroen/features/iuran/domain/usecases/listen_transaction_iuran.dart';
import 'package:oeroen/features/warga/domain/repositories/i_warga_repository.dart';
import 'package:oeroen/features/warga/domain/usecases/get_warga.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.put<BerandaController>(
      BerandaController(
        listenTransactionIuraan:
            ListenTransactionIuran(Get.find<IIuranRepository>()),
        listenActiveIuran: ListenActiveIuran(Get.find<IIuranRepository>()),
      ),
    );
    Get.put<DesaController>(
      DesaController(
        listenDesa: ListenDesa(Get.find<IDesaRepository>()),
        listenTransactionDesa:
            ListenTransactionDesa(Get.find<IIuranRepository>()),
        getWarga: GetWarga(Get.find<IWargaRepository>()),
      ),
    );
  }
}
