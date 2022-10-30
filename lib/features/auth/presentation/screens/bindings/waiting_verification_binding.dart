import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:oeroen/features/auth/presentation/application/waiting_verification_controller.dart';

class WaitingVerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WaitingVerificationController>(
      () => WaitingVerificationController(
        authRepository: Get.find<IAuthRepository>(),
        storage: Get.find<GetStorage>(),
      ),
    );
  }
}
