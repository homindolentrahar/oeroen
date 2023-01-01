import 'package:get/get.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:oeroen/features/auth/presentation/application/admin_auth_controller.dart';

class AdminAuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminAuthController>(
      () => AdminAuthController(
        repository: Get.find<IAuthRepository>(),
      ),
    );
  }
}
