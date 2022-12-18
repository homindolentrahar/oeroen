import 'package:get/get.dart';
import 'package:oeroen/features/beranda/presentation/application/recent_transaction_controller.dart';
import 'package:oeroen/features/iuran/domain/repositories/i_iuran_repository.dart';
import 'package:oeroen/features/iuran/domain/usecases/listen_transaction_iuran.dart';

class RecentTransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecentTransactionController>(
      () => RecentTransactionController(
        listenPaidIuran: ListenTransactionIuran(Get.find<IIuranRepository>()),
      ),
    );
  }
}
