import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:oeroen/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:oeroen/routes/app_route.dart';
import 'package:oeroen/utils/dialog_util.dart';
import 'package:oeroen/utils/snackbar_util.dart';

class AdminAuthController extends GetxController {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  AdminAuthController({
    required this.repository,
    required this.signInWithGoogle,
  });

  final IAuthRepository repository;
  final SignInWithGoogle signInWithGoogle;

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    DialogUtil.showLoading();

    final result = await repository.verifyPhoneNumber(
      "+62$phoneNumber",
      codeSent: (String verificationId, int? resendToken) {
        DialogUtil.hideLoading();

        Get.toNamed(
          AppRoute.adminOtpRoute,
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

  Future<void> googleLogin() async {
    DialogUtil.showLoading();

    final result = await signInWithGoogle(type: AuthRoleType.admin);

    DialogUtil.hideLoading();

    result.fold(
      (error) {
        Logger().e(error);
        SnackBarUtil.showError(message: error.message);
      },
      (_) async {
        Get.offAllNamed(AppRoute.adminMainRoute);
      },
    );
  }
}
