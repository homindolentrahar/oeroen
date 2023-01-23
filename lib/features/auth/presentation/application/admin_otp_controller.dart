import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:oeroen/routes/app_route.dart';
import 'package:oeroen/utils/dialog_util.dart';
import 'package:oeroen/utils/snackbar_util.dart';

class AdminOtpController extends GetxController {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  AdminOtpController({required this.repository});

  final IAuthRepository repository;

  String verificationId = "";
  String phoneNumber = "";
  final Rx<int> timeout = 0.obs;

  @override
  void onInit() {
    final data = Get.arguments as Map<String, dynamic>;
    verificationId = data['verificationId'];
    phoneNumber = data['phone'];

    update();

    startTimeOut();

    super.onInit();
  }

  Future<void> verifyPhoneNumber() async {
    DialogUtil.showLoading();

    final result = await repository.verifyPhoneNumber(
      "+62$phoneNumber",
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId = verificationId;
        update();

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
  }) async {
    DialogUtil.showLoading();

    final result = await repository.signInWithOtp(
      otpCode: otp,
      verificationId: verificationId,
      type: AuthRoleType.admin,
    );

    DialogUtil.hideLoading();

    result.fold(
      (error) {
        Logger().e(error);
        SnackBarUtil.showError(message: error);
      },
      (unit) {
        Get.offAllNamed(AppRoute.adminMainRoute);
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
