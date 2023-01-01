import 'package:get/get.dart';
import 'package:oeroen/core/presentation/application/admin_main_controller.dart';
import 'package:oeroen/features/desa/domain/repositories/i_desa_repository.dart';
import 'package:oeroen/features/desa/domain/usecases/listen_all_data.dart';
import 'package:oeroen/features/transaction/domain/repositories/i_warga_transaction_repository.dart';
import 'package:oeroen/features/transaction/domain/usecases/listen_transactions_in_desa.dart';

class AdminMainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AdminMainController(
        getAllDesa: ListenAllDesa(
          Get.find<IDesaRepository>(),
        ),
        listenTransactionsInDesa: ListenTransactionsInDesa(
          Get.find<IWargaTransactionRepository>(),
        ),
      ),
    );
  }
}
