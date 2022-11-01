import 'package:get/get.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:oeroen/features/auth/presentation/application/otp_sign_controller.dart';
import 'package:oeroen/features/auth/presentation/application/user_sign_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserSignController>(
      () => UserSignController(
        authRepository: Get.find<IAuthRepository>(),
      ),
    );
    Get.lazyPut<OtpSignController>(
      () => OtpSignController(
        authRepository: Get.find<IAuthRepository>(),
      ),
    );
  }
}
