import 'package:get/get.dart';
import 'package:oeroen/features/desa/domain/repositories/i_desa_repository.dart';
import 'package:oeroen/features/desa/domain/usecases/add_desa.dart';
import 'package:oeroen/features/desa/domain/usecases/delete_desa.dart';
import 'package:oeroen/features/desa/domain/usecases/update_desa.dart';
import 'package:oeroen/features/desa/presentation/application/admin_crud_desa_controller.dart';

class AdminCrudDesaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminCrudDesaController>(
      () => AdminCrudDesaController(
        addDesaUseCase: AddDesa(Get.find<IDesaRepository>()),
        updateDesaUseCase: UpdateDesa(Get.find<IDesaRepository>()),
        deleteDesaUseCase: DeleteDesa(Get.find<IDesaRepository>()),
      ),
    );
  }
}
