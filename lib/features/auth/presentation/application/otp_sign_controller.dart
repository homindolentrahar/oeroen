import 'package:get/get.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/auth/domain/usecases/sign_in_with_otp.dart';
import 'package:oeroen/features/auth/domain/usecases/verify_phone_number.dart';
import 'package:oeroen/features/auth/presentation/application/otp_sign_state.dart';

class OtpSignController extends GetxController with StateMixin<OtpSignState> {
  final VerifyPhoneNumber _verifyPhoneNumber;
  final SignInWithOtp _signInWithOtp;

  OtpSignController({
    required VerifyPhoneNumber verifyPhoneNumber,
    required SignInWithOtp signInWithOtp,
  })  : _verifyPhoneNumber = verifyPhoneNumber,
        _signInWithOtp = signInWithOtp;

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    change(null, status: RxStatus.loading());

    final result = await _verifyPhoneNumber(
      phoneNumber,
      codeSent: (String verificationId, int? resendToken) {
        change(state?.copyWith(
          verificationId: verificationId,
          phoneNumber: phoneNumber,
        ));
      },
      verificationFailed: (AppError exception) {
        change(null, status: RxStatus.error(exception.message));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        //  TODO: Handle when auto retrieval timeout
      },
    );

    result.fold(
      (error) {
        change(null, status: RxStatus.error(error));
      },
      (unit) {
        change(state, status: RxStatus.success());
      },
    );
  }

  Future<void> signInWithOtp(String otp) async {
    change(null, status: RxStatus.loading());

    final result = await _signInWithOtp(
      otpCode: otp,
      verificationId: state?.verificationId ?? "",
    );

    result.fold(
      (error) {
        change(null, status: RxStatus.error(error));
      },
      (unit) {
        change(state, status: RxStatus.success());
      },
    );
  }
}
