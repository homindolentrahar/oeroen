import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/auth/presentation/application/auth_controller.dart';
import 'package:oeroen/presentation/widgets/app_fill_button.dart';

class DialogUtil {
  static void showLoading() {
    Get.generalDialog(
      barrierDismissible: false,
      pageBuilder: (context, animation, secondaryAnimation) => WillPopScope(
        onWillPop: () async => false,
        child: const AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: SpinKitCircle(color: AppColor.white),
        ),
      ),
    );
  }

  static void hideLoading() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }

  static void showVerificationAttemptWarning() {
    Get.dialog(
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Masih tidak mendapatkan email?",
              style: TextStyle(
                color: AppColor.black,
                fontSize: 20,
                fontFamily: AppFont.semiBold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Mungkin kamu masuk menggunakan email yang salah",
              style: TextStyle(
                color: AppColor.black,
                fontSize: 14,
                fontFamily: AppFont.regular,
              ),
            ),
            const SizedBox(height: 32),
            AppFillButton(
              text: "Masuk dengan Email lain",
              color: AppColor.red,
              textColor: AppColor.white,
              onPressed: () {
                Get.find<AuthController>().signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
