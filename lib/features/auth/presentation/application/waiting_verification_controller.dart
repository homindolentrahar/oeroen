import 'dart:async';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:oeroen/utils/dialog_util.dart';
import 'package:oeroen/utils/snackbar_util.dart';

class WaitingVerificationController extends GetxController {
  final IAuthRepository _authRepository;

  WaitingVerificationController({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  final Rx<int> timeout = 0.obs;

  Future<void> reload() async => await _authRepository.reload();

  Future<void> sendVerificationEmail() async {
    Logger().w("Sending Verification Email...");

    DialogUtil.showLoading();

    final currentUser = _authRepository.currentUser;

    DialogUtil.hideLoading();

    currentUser.fold(
      () {
        //  Do Nothing
      },
      (user) async {
        final result = await _authRepository.sendVerificationEmail(user.email);

        result.fold(
          (error) {
            Logger().e(error);
            SnackBarUtil.showError(message: error);
          },
          (_) {
            startTimeOut();
          },
        );
      },
    );
  }

  void startTimeOut({int duration = 60}) {
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
