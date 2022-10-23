import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:oeroen/routes/app_route.dart';

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
    final result = await _authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

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
        Get.offAllNamed(AppRoute.mainRoute);
      },
    );
  }

  Future<void> googleLogin() async {
    final result = await _authRepository.signInWithGoogle();

    result.fold(
      (error) {
        Logger().e(error);
        Get.snackbar(
          "Terjadi kesalahan",
          "Tidak dapat mengeluarkan akun",
          borderRadius: 8,
        );
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
    final result = await _authRepository.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    result.fold(
      (error) {
        Logger().e(error);
        Get.snackbar(
          "Terjadi kesalahan",
          "Tidak dapat mengeluarkan akun",
          borderRadius: 8,
        );
      },
      (unit) {
        Get.offAllNamed(AppRoute.mainRoute);
      },
    );
  }
}
