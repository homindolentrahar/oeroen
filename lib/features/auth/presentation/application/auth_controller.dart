import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:oeroen/features/auth/domain/models/auth_user.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:oeroen/routes/app_route.dart';

class AuthController extends GetxController {
  final IAuthRepository _authRepository;

  AuthController({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  final authStateChanges = Rx<Option<AuthUser>>(none());

  @override
  void onReady() {
    authStateChanges.bindStream(_authRepository.authStateChanges());
    debounce(authStateChanges, (Option<AuthUser> authState) {
      authState.fold(
        () {
          // TODO: In purpose of redesign UI,revert back to AppRoute.authRoute
          Get.offAllNamed(AppRoute.authRoute);
        },
        (authUser) {
          Get.offAllNamed(AppRoute.mainRoute);
        },
      );
    }, time: const Duration(milliseconds: 2000));

    super.onReady();
  }

  Future<void> signOut() async {
    final result = await _authRepository.signOut();

    result.fold(
      (error) {
        Get.snackbar(
          "Terjadi kesalahan",
          "Tidak dapat mengeluarkan akun",
          borderRadius: 8,
        );
      },
      (_) {
        Get.offAllNamed(AppRoute.authRoute);
      },
    );
  }
}
