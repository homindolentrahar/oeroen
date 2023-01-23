import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:oeroen/features/auth/domain/models/auth_user.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:oeroen/features/warga/domain/usecases/get_warga.dart';
import 'package:oeroen/routes/app_route.dart';
import 'package:oeroen/utils/dialog_util.dart';
import 'package:oeroen/utils/snackbar_util.dart';

class AuthController extends GetxController {
  final GetWarga getWarga;
  final IAuthRepository _authRepository;
  final GetStorage _storage;

  AuthController({
    required this.getWarga,
    required IAuthRepository authRepository,
    required GetStorage storage,
  })  : _authRepository = authRepository,
        _storage = storage;

  final authStateChanges = Rx<Future<Option<AuthUser>>>(
    Future.value(none<AuthUser>()),
  );

  @override
  void onReady() {
    onAuthStateChanges();

    super.onReady();
  }

  void onAuthStateChanges() {
    authStateChanges.bindStream(_authRepository.authStateChanges());
    debounce(authStateChanges, (Future<Option<AuthUser>> authState) async {
      (await authState).fold(
        () {
          Get.offAllNamed(AppRoute.authRoute);
        },
        (authUser) async {
          Logger().i("Auth User Verified: ${authUser.isVerified}");
          if (authUser.role == "warga") {
            if (authUser.isVerified || authUser.providerId == 'phone') {
              // TODO: Check if the user already join a desa
              final eitherWarga = await getWarga();

              eitherWarga.fold(
                (error) {},
                (warga) {
                  if (warga.listDesa != null && warga.listDesa!.isNotEmpty) {
                    Get.offAllNamed(AppRoute.mainRoute);
                  } else {
                    Get.offAllNamed(AppRoute.desaRegisterRoute);
                  }
                },
              );
            } else {
              if (Get.currentRoute != AppRoute.waitingVerificationRoute) {
                Get.offAllNamed(AppRoute.waitingVerificationRoute);
              }
            }
          } else if (authUser.role == "admin") {
            Get.offAllNamed(AppRoute.adminMainRoute);
          } else {
            Get.offAllNamed(AppRoute.authRoute);
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
      (_) async {
        await _storage.write('verifAttempt', 0);
        Get.offAllNamed(AppRoute.authRoute);
      },
    );
  }
}
