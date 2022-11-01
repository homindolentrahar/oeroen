import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';

class SnackBarUtil {
  static void showSuccess({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      borderRadius: 10,
      icon: SvgPicture.asset(
        "assets/icons/ic_success.svg",
        width: 16,
        height: 16,
        color: AppColor.green,
      ),
      colorText: AppColor.white,
      backgroundColor: AppColor.black,
    );
  }

  static void showError({
    String title = "Terjadi kesalahan",
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      borderRadius: 10,
      icon: SvgPicture.asset(
        "assets/icons/ic_error.svg",
        width: 16,
        height: 16,
        color: AppColor.white,
      ),
      colorText: AppColor.white,
      backgroundColor: AppColor.red,
    );
  }

  static void showInfo({
    required String title,
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      borderRadius: 10,
      icon: SvgPicture.asset(
        "assets/icons/ic_info.svg",
        width: 16,
        height: 16,
        color: AppColor.white,
      ),
      colorText: AppColor.white,
      backgroundColor: AppColor.red,
    );
  }
}
