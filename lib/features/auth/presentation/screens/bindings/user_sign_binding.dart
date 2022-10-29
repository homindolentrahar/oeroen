import 'package:get/get.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:oeroen/features/auth/presentation/application/user_sign_controller.dart';

class UserSignBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserSignController>(
      () => UserSignController(
        authRepository: Get.find<IAuthRepository>(),
      ),
    );
  }
}
