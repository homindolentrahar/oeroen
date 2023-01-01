import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/auth/presentation/application/admin_otp_controller.dart';
import 'package:oeroen/presentation/widgets/app_fill_button.dart';
import 'package:oeroen/presentation/widgets/app_text_button.dart';
import 'package:oeroen/presentation/widgets/app_text_field.dart';
import 'package:oeroen/utils/extension/int_extensions.dart';
import 'package:oeroen/utils/extension/string_extensions.dart';

class AdminOtpScreen extends GetView<AdminOtpController> {
  const AdminOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.light,
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
                    "Masukkan 6 digit kode yang telah kami kirimkan ke +62${controller.phoneNumber.formatObscurePhone()}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColor.dark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              FormBuilder(
                key: controller.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                autoFocusOnValidationFailure: true,
                child: Column(
                  children: [
                    PinTextField(
                      name: "otp",
                      keyboardType: TextInputType.number,
                      additionalValidators: [
                        FormBuilderValidators.numeric(),
                      ],
                      onChanged: (value) {},
                      onCompleted: (value) {
                        controller.signInWithOtp(otp: value);
                      },
                    ),
                    const SizedBox(height: 64),
                    AppFillButton(
                      text: "Verifikasi",
                      onPressed: () {
                        if (controller.formKey.currentState!
                            .saveAndValidate()) {
                          final otp =
                              controller.formKey.currentState!.value['otp'];
                          controller.signInWithOtp(otp: otp);
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
                                      controller.verifyPhoneNumber();
                                    }),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
