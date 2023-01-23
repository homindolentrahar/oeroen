import 'package:get/get.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:oeroen/features/auth/presentation/application/admin_otp_controller.dart';

class AdminOtpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminOtpController>(() => AdminOtpController(
          repository: Get.find<IAuthRepository>(),
        ));
  }
}
