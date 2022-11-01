import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/auth/presentation/application/otp_sign_controller.dart';
import 'package:oeroen/presentation/widgets/app_fill_button.dart';
import 'package:oeroen/presentation/widgets/app_text_button.dart';
import 'package:oeroen/presentation/widgets/app_text_field.dart';
import 'package:oeroen/utils/int_extensions.dart';
import 'package:oeroen/utils/string_extensions.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  const OtpScreen({
    Key? key,
    required this.verificationId,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late OtpSignController controller;
  late GlobalKey<FormBuilderState> formKey;

  @override
  void initState() {
    controller = Get.find<OtpSignController>()
      ..setInitialVerificationId(widget.verificationId);
    formKey = GlobalKey<FormBuilderState>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.startTimeOut();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextButton(
                text: "Kembali",
                textColor: AppColor.dark,
                icon: SvgPicture.asset(
                  "assets/icons/ic_chevron_left.svg",
                  width: 20,
                  height: 20,
                  color: AppColor.dark,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              const SizedBox(height: 64),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "assets/icons/logo.svg",
                    width: 48,
                    height: 48,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Kode OTP",
                    style: TextStyle(
                      fontFamily: AppFont.semiBold,
                      fontSize: 32,
                      color: AppColor.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Masukkan 6 digit kode yang telah kami kirimkan ke +62${widget.phoneNumber.formatObscurePhone()}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColor.dark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              FormBuilder(
                key: formKey,
                autovalidateMode: AutovalidateMode.disabled,
                autoFocusOnValidationFailure: true,
                child: Column(
                  children: [
                    PinTextField(
                      name: "otp",
                      keyboardType: TextInputType.number,
                      onChanged: (value) {},
                      onCompleted: (value) {
                        controller.signInWithOtp(
                          otp: value,
                          verificationId: controller.verificationId,
                        );
                      },
                    ),
                    const SizedBox(height: 64),
                    AppFillButton(
                      text: "Verifikasi",
                      onPressed: () {
                        if (formKey.currentState!.saveAndValidate()) {
                          final otp = formKey.currentState!.value['otp'];
                          controller.signInWithOtp(
                            otp: otp,
                            verificationId: controller.verificationId,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.center,
                child: Obx(
                  () => RichText(
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
                              ..onTap = controller.timeout.value > 0
                                  ? null
                                  : () {
                                      controller.verifyPhoneNumber(
                                          widget.phoneNumber);
                                    }),
                      ],
                    ),
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
