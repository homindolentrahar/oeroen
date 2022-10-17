import 'dart:async';

import 'package:get/get.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/auth/domain/usecases/sign_in_with_otp.dart';
import 'package:oeroen/features/auth/domain/usecases/verify_phone_number.dart';
import 'package:oeroen/features/auth/presentation/application/otp_sign_state.dart';

class OtpSignController extends GetxController {
  final VerifyPhoneNumber _verifyPhoneNumber;
  final SignInWithOtp _signInWithOtp;

  OtpSignController({
    required VerifyPhoneNumber verifyPhoneNumber,
    required SignInWithOtp signInWithOtp,
  })  : _verifyPhoneNumber = verifyPhoneNumber,
        _signInWithOtp = signInWithOtp;

  final Rx<int> timeout = 0.obs;
  final Rx<OtpSignState> _state = const OtpSignState().obs;

  OtpSignState get state => _state.value;

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    final result = await _verifyPhoneNumber(
      phoneNumber,
      codeSent: (String verificationId, int? resendToken) {
        _emit(
          _state.value.copyWith(
            verificationId: verificationId,
            phoneNumber: phoneNumber,
          ),
        );
      },
      verificationFailed: (AppError exception) {
        //  TODO: Show Error snackbar
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        //  TODO: Handle when auto retrieval timeout
      },
    );

    result.fold(
      (error) {
        //  TODO: Show Error snackbar
      },
      (unit) {
        //  TODO: Show Success snackbar
        _startTimeOut();
      },
    );
  }

  Future<void> signInWithOtp(String otp) async {
    final result = await _signInWithOtp(
      otpCode: otp,
      verificationId: _state.value.verificationId ?? "",
    );

    result.fold(
      (error) {
        //  TODO: Show Error snackbar
      },
      (unit) {
        //  TODO: Show Success snackbar
      },
    );
  }

  void _emit(OtpSignState data) {
    _state.value = data;
  }

  void _startTimeOut({int duration = 90}) {
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
