import 'package:get/get.dart';
import 'package:oeroen/features/desa/domain/usecases/listen_transaction_desa.dart';
import 'package:oeroen/features/desa/presentation/application/desa_transaction_controller.dart';
import 'package:oeroen/features/iuran/domain/repositories/i_iuran_repository.dart';

class DesaTransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DesaTransactionController>(
      () => DesaTransactionController(
          listenTransactionDesa:
              ListenTransactionDesa(Get.find<IIuranRepository>())),
    );
  }
}
