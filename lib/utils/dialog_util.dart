import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';

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
}
