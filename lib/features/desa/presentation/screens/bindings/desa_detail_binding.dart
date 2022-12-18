import 'package:get/get.dart';
import 'package:oeroen/features/desa/domain/repositories/i_desa_repository.dart';
import 'package:oeroen/features/desa/domain/usecases/listen_desa.dart';
import 'package:oeroen/features/desa/presentation/application/desa_detail_controller.dart';

class DesaDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DesaDetailController>(
      () => DesaDetailController(
        listenDesa: ListenDesa(Get.find<IDesaRepository>()),
      ),
    );
  }
}
