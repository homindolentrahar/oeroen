import 'package:get/get.dart';
import 'package:oeroen/features/iuran/domain/repositories/i_iuran_repository.dart';
import 'package:oeroen/features/iuran/domain/usecases/listen_active_iuran.dart';
import 'package:oeroen/features/iuran/domain/usecases/listen_transaction_iuran.dart';
import 'package:oeroen/features/iuran/presentation/application/iuran_controller.dart';

class IuranBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IuranController>(
      () => IuranController(
        listenActiveIuran: ListenActiveIuran(Get.find<IIuranRepository>()),
        listenTransactionIuran:
            ListenTransactionIuran(Get.find<IIuranRepository>()),
      ),
    );
  }
}
