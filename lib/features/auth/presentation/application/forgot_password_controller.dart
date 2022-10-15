import 'dart:async';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:oeroen/routes/app_route.dart';

class ForgotPasswordController extends GetxController {
  final IAuthRepository _authRepository;

  ForgotPasswordController({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  final Rx<int> timeout = 0.obs;

  Future<void> forgotPassword(String email) async {
    final result = await _authRepository.forgotPassword(email);

    result.fold(
      (error) {
        Logger().e(error);
        Get.snackbar(
          "Terjadi kesalahan",
          "Tidak dapat mengeluarkan akun",
          borderRadius: 8,
        );
      },
      (_) {
        //  Navigate to OTP screen & start timer
        _startTimeout();
        Get.toNamed(AppRoute.otpRoute);
      },
    );
  }

  void _startTimeout({int duration = 15}) {
    timeout.value = duration;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeout.value > 0) {
        timeout.value -= 1;
      } else {
        timeout.value = 0;
        timer.cancel();
      }
    });
  }
}
