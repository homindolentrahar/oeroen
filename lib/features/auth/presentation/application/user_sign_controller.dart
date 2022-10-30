import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:oeroen/routes/app_route.dart';
import 'package:oeroen/utils/dialog_util.dart';
import 'package:oeroen/utils/snackbar_util.dart';

class UserSignController extends GetxController {
  final IAuthRepository _authRepository;

  UserSignController({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  final Rx<int> authNavIndex = 0.obs;

  void changeNavIndex(int index) {
    authNavIndex.value = index;

    final route =
        index == 0 ? AppRoute.loginPhoneRoute : AppRoute.loginEmailRoute;

    Get.rootDelegate.toNamed(AppRoute.authRoute + route);
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    DialogUtil.showLoading();

    final result = await _authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    DialogUtil.hideLoading();

    result.fold(
      (error) {
        Logger().e(error);
        SnackBarUtil.showError(message: error);
      },
      (_) {},
    );
  }

  Future<void> googleLogin() async {
    DialogUtil.showLoading();

    final result = await _authRepository.signInWithGoogle();

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

  Future<void> register({
    required String email,
    required String password,
  }) async {
    DialogUtil.showLoading();

    final result = await _authRepository.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    DialogUtil.hideLoading();

    result.fold(
      (error) {
        Logger().e(error);
        SnackBarUtil.showError(message: error);
      },
      (unit) {
        Get.offAllNamed(AppRoute.waitingVerificationRoute);
      },
    );
  }

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    DialogUtil.showLoading();

    final result = await _authRepository.verifyPhoneNumber(
      "+62$phoneNumber",
      codeSent: (String verificationId, int? resendToken) {
        DialogUtil.hideLoading();

        Get.toNamed(
          AppRoute.otpRoute,
          arguments: {
            'verificationId': verificationId,
            'phone': phoneNumber,
          },
        );
      },
      verificationFailed: (exception) {
        Logger().e(exception.message);

        DialogUtil.hideLoading();

        SnackBarUtil.showError(message: exception.message.toString());
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
}
