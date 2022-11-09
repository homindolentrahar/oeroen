import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/auth/presentation/application/forgot_password_controller.dart';
import 'package:oeroen/presentation/widgets/app_fill_button.dart';
import 'package:oeroen/presentation/widgets/app_text_button.dart';
import 'package:oeroen/presentation/widgets/app_text_field.dart';
import 'package:oeroen/utils/int_extensions.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
    final controller = Get.find<ForgotPasswordController>();

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
                children: const [
                  Text(
                    "Lupa Kata Sandi",
                    style: TextStyle(
                      fontFamily: AppFont.semiBold,
                      fontSize: 32,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Tidak perlu panik, kami akan kirimkan link pengubah kata sandi ke email mu",
                    style: TextStyle(
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
                    AppTextField(
                      name: 'email',
                      hintText: "Alamat Email",
                      prefix: SvgPicture.asset(
                        "assets/icons/ic_email.svg",
                        width: 16,
                        height: 16,
                        color: AppColor.gray,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      action: TextInputAction.next,
                      validators: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                    const SizedBox(height: 64),
                    Obx(
                      () => AppFillButton(
                        text: "Kirim Email",
                        onPressed: controller.timeout.value > 0
                            ? null
                            : () {
                                if (formKey.currentState!.saveAndValidate()) {
                                  controller.sendResetPasswordEmail(
                                    formKey.currentState!.value['email'],
                                  );
                                }
                              },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Obx(
                () => controller.timeout.value > 0
                    ? Align(
                        alignment: Alignment.center,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: const TextStyle(
                              color: AppColor.dark,
                              fontSize: 14,
                              fontFamily: AppFont.regular,
                            ),
                            children: [
                              const TextSpan(
                                text:
                                    "Tunggu sebentar, kami sedang mengirimkan email kepadamu!",
                              ),
                              TextSpan(
                                text: controller.timeout.value.formatTimer(),
                                style: TextStyle(
                                  color: Get.theme.primaryColor,
                                  fontFamily: AppFont.semiBold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
