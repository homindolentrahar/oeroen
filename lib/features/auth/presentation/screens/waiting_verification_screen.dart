import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';

class WaitingVerificationScreen extends StatelessWidget {
  const WaitingVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.light,
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
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: AppColor.dark,
                      fontSize: 14,
                      fontFamily: AppFont.regular,
                    ),
                    children: [
                      const TextSpan(text: "Belum menerima Email? "),
                      TextSpan(
                        text: "Kirim Ulang",
                        style: TextStyle(
                          color: Get.theme.primaryColor,
                          fontFamily: AppFont.semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
