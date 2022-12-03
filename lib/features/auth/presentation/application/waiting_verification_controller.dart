import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:oeroen/utils/dialog_util.dart';
import 'package:oeroen/utils/snackbar_util.dart';

class WaitingVerificationController extends GetxController {
  final IAuthRepository _authRepository;
  final GetStorage _storage;

  WaitingVerificationController(
      {required IAuthRepository authRepository, required GetStorage storage})
      : _authRepository = authRepository,
        _storage = storage;

  final Rx<int> timeout = 0.obs;
  final Rx<bool> showVerifAttempt = false.obs;

  @override
  void onReady() {
    _storage.listenKey(
      'verifAttempt',
      (value) {
        final int attempt = (value as int?) ?? 0;
        Logger().w("Attemp: $attempt");

        if (attempt >= 3) {
          showVerifAttempt.value = true;
        } else {
          showVerifAttempt.value = false;
        }
      },
    );

    super.onReady();
  }

  Future<void> reload() async => await _authRepository.reload();

  Future<void> sendVerificationEmail() async {
    DialogUtil.showLoading();

    final currentUser = _authRepository.currentUser;

    DialogUtil.hideLoading();

    currentUser.fold(
      () {
        //  Do Nothing
      },
      (user) async {
        if (user.email == null) {
          return;
        }

        final result =
            await _authRepository.sendVerificationEmail(user.email.toString());

        result.fold(
          (error) {
            Logger().e(error);
            SnackBarUtil.showError(message: error);
          },
          (_) {
            _incrementVerifAttemptCount();
            startTimeOut();
          },
        );
      },
    );
  }

  Future<void> _incrementVerifAttemptCount() async {
    final int previousAttempt = (_storage.read("verifAttempt") as int?) ?? 0;
    final int attempt = previousAttempt + 1;

    await _storage.write("verifAttempt", attempt);
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
