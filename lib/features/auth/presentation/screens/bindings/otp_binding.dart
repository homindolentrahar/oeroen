import 'package:get/get.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:oeroen/features/auth/presentation/application/otp_sign_controller.dart';

class OtpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpSignController>(
      () => OtpSignController(
        authRepository: Get.find<IAuthRepository>(),
      ),
    );
  }
}
