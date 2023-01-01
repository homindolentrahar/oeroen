import 'package:get/get.dart';
import 'package:oeroen/features/desa/domain/repositories/i_desa_repository.dart';
import 'package:oeroen/features/desa/domain/usecases/get_desa_by_code.dart';
import 'package:oeroen/features/iuran/domain/repositories/i_iuran_repository.dart';
import 'package:oeroen/features/iuran/domain/usecases/get_iuran.dart';
import 'package:oeroen/features/iuran/presentation/application/iuran_detail_controller.dart';

class IuranDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IuranDetailController>(
      () => IuranDetailController(
        getIuran: GetIuran(Get.find<IIuranRepository>()),
        getDesaByCode: GetDesaByCode(Get.find<IDesaRepository>()),
      ),
    );
  }
}
