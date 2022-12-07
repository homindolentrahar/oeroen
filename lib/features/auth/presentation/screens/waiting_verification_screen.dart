import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/auth/presentation/application/auth_controller.dart';
import 'package:oeroen/features/auth/presentation/application/waiting_verification_controller.dart';
import 'package:oeroen/utils/extension/int_extensions.dart';

class WaitingVerificationScreen extends StatefulWidget {
  const WaitingVerificationScreen({Key? key}) : super(key: key);

  @override
  State<WaitingVerificationScreen> createState() =>
      _WaitingVerificationScreenState();
}

class _WaitingVerificationScreenState extends State<WaitingVerificationScreen> {
  late WaitingVerificationController controller;

  @override
  void initState() {
    controller = Get.find<WaitingVerificationController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.sendVerificationEmail();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onForegroundGained: () {
        controller.reload();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Menunggu Verifikasi",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppFont.semiBold,
                    fontSize: 32,
                    color: AppColor.black,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Kami telah mengirimkan tautan verifikasi ke alamat email kamu. Silahkan dicek kembali",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColor.dark,
                  ),
                ),
                const SizedBox(height: 64),
                Align(
                  alignment: Alignment.center,
                  child: Obx(
                    () => controller.showVerifAttempt.value
                        ? RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                color: AppColor.dark,
                                fontSize: 14,
                                fontFamily: AppFont.regular,
                              ),
                              children: [
                                const TextSpan(
                                    text: "Masih Belum menerima Email? "),
                                TextSpan(
                                  text: "Masuk Ulang",
                                  style: const TextStyle(
                                    color: AppColor.red,
                                    fontFamily: AppFont.semiBold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.find<AuthController>().signOut();
                                    },
                                ),
                              ],
                            ),
                          )
                        : RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                color: AppColor.dark,
                                fontSize: 14,
                                fontFamily: AppFont.regular,
                              ),
                              children: [
                                const TextSpan(text: "Belum menerima Email? "),
                                TextSpan(
                                  text: controller.timeout.value > 0
                                      ? controller.timeout.value.formatTimer()
                                      : "Kirim Ulang",
                                  style: TextStyle(
                                    color: Get.theme.primaryColor,
                                    fontFamily: AppFont.semiBold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      controller.sendVerificationEmail();
                                    },
                                ),
                              ],
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
