import 'dart:async';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:oeroen/routes/app_route.dart';
import 'package:oeroen/utils/dialog_util.dart';
import 'package:oeroen/utils/snackbar_util.dart';

class OtpSignController extends GetxController {
  final IAuthRepository _authRepository;

  OtpSignController({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  final Rx<String> _verificationId = "".obs;
  final Rx<int> timeout = 0.obs;

  String get verificationId => _verificationId.value;

  void setInitialVerificationId(String id) {
    _verificationId.value = id;
  }

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    DialogUtil.showLoading();

    final result = await _authRepository.verifyPhoneNumber(
      "+62$phoneNumber",
      codeSent: (String verificationId, int? resendToken) {
        _verificationId.value = verificationId;

        DialogUtil.hideLoading();
        startTimeOut();
      },
      verificationFailed: (exception) {
        Logger().e(exception.message);

        DialogUtil.hideLoading();
      },
    );

    result.fold(
      (error) {
        Logger().e(error);
        SnackBarUtil.showError(message: error);
      },
      (_) {},
    );
  }

  Future<void> signInWithOtp({
    required String otp,
    required String verificationId,
  }) async {
    DialogUtil.showLoading();

    final result = await _authRepository.signInWithOtp(
      otpCode: otp,
      verificationId: verificationId,
    );

    DialogUtil.hideLoading();

    result.fold(
      (error) {
        Logger().e(error);
        SnackBarUtil.showError(message: error);
      },
      (unit) {
        Get.offAllNamed(AppRoute.mainRoute);
      },
    );
  }

  void startTimeOut({int duration = 90}) {
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
