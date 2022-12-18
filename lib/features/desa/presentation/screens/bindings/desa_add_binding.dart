import 'package:get/get.dart';
import 'package:oeroen/features/desa/domain/repositories/i_desa_repository.dart';
import 'package:oeroen/features/desa/domain/usecases/get_desa_by_code.dart';
import 'package:oeroen/features/desa/presentation/application/desa_add_controller.dart';
import 'package:oeroen/features/warga/domain/repositories/i_warga_repository.dart';
import 'package:oeroen/features/warga/domain/usecases/get_warga.dart';
import 'package:oeroen/features/warga/domain/usecases/update_warga.dart';

class DesaAddBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DesaAddController>(() => DesaAddController(
          getDesaByCode: GetDesaByCode(Get.find<IDesaRepository>()),
          getWarga: GetWarga(Get.find<IWargaRepository>()),
          updateWarga: UpdateWarga(Get.find<IWargaRepository>()),
        ));
  }
}
