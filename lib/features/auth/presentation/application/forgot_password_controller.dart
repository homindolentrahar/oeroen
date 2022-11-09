import 'dart:async';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:oeroen/utils/dialog_util.dart';
import 'package:oeroen/utils/snackbar_util.dart';

class ForgotPasswordController extends GetxController {
  final IAuthRepository _authRepository;

  ForgotPasswordController({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  final Rx<int> timeout = 0.obs;

  Future<void> sendResetPasswordEmail(String email) async {
    DialogUtil.showLoading();

    final result = await _authRepository.forgotPassword(email);

    DialogUtil.hideLoading();

    result.fold(
      (error) {
        Logger().e(error);
        SnackBarUtil.showError(message: error);
      },
      (_) {
        SnackBarUtil.showSuccess(
          title: "Email berhasil terkirim!",
          message:
              "Kami telah mengirimkan email yang berisi tautan untuk mereset password akun anda",
        );
        _startTimeout();
      },
    );
  }

  void _startTimeout({int duration = 60}) {
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
