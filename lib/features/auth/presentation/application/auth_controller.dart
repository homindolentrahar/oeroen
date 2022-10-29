import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:oeroen/features/auth/domain/models/auth_user.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:oeroen/routes/app_route.dart';
import 'package:oeroen/utils/dialog_util.dart';
import 'package:oeroen/utils/snackbar_util.dart';

class AuthController extends GetxController {
  final IAuthRepository _authRepository;

  AuthController({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  final authStateChanges = Rx<Option<AuthUser>>(none());

  @override
  void onReady() {
    onAuthStateChanges();

    super.onReady();
  }

  void onAuthStateChanges() {
    authStateChanges.bindStream(_authRepository.authStateChanges());
    debounce(authStateChanges, (Option<AuthUser> authState) {
      Logger().i("Auth State changed!");
      authState.fold(
        () {
          Get.offAllNamed(AppRoute.authRoute);
        },
        (authUser) {
          Logger().i("Auth User Verified: ${authUser.isVerified}");
          if (authUser.isVerified || authUser.providerId == 'phone') {
            Get.offAllNamed(AppRoute.mainRoute);
          } else {
            if (Get.currentRoute != AppRoute.waitingVerificationRoute) {
              Get.offAllNamed(AppRoute.waitingVerificationRoute);
            }
          }
        },
      );
    }, time: const Duration(milliseconds: 2000));
  }

  Future<void> signOut() async {
    DialogUtil.showLoading();

    final result = await _authRepository.signOut();

    DialogUtil.hideLoading();

    result.fold(
      (error) {
        Logger().e(error);
        SnackBarUtil.showError(message: error);
      },
      (_) {
        Get.offAllNamed(AppRoute.authRoute);
      },
    );
  }
}
