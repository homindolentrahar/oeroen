import 'dart:async';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';

class WaitingVerificationController extends GetxController {
  final IAuthRepository _authRepository;

  WaitingVerificationController({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  final Rx<int> timeout = 0.obs;

  Future<void> sendVerificationEmail() async {
    final currentUser = _authRepository.currentUser;

    currentUser.fold(
      () {},
      (user) async {
        final result = await _authRepository.sendVerificationEmail(user.email);

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
            _startTimeOut();
          },
        );
      },
    );
  }

  void _startTimeOut({int duration = 60}) {
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
