import 'package:get/get.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:oeroen/features/auth/presentation/application/otp_sign_controller.dart';
import 'package:oeroen/features/auth/presentation/application/user_sign_controller.dart';
import 'package:oeroen/features/warga/domain/repositories/i_warga_repository.dart';
import 'package:oeroen/features/warga/domain/usecases/get_warga.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserSignController>(
      () => UserSignController(
        authRepository: Get.find<IAuthRepository>(),
        getWarga: GetWarga(Get.find<IWargaRepository>()),
      ),
    );
    Get.lazyPut<OtpSignController>(
      () => OtpSignController(
        authRepository: Get.find<IAuthRepository>(),
      ),
    );
  }
}
