import 'package:get/get.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:oeroen/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:oeroen/features/auth/presentation/application/admin_auth_controller.dart';

class AdminAuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminAuthController>(
      () => AdminAuthController(
        signInWithGoogle: SignInWithGoogle(Get.find<IAuthRepository>()),
        repository: Get.find<IAuthRepository>(),
      ),
    );
  }
}
