import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/auth/presentation/application/forgot_password_controller.dart';
import 'package:oeroen/presentation/widgets/app_back_button.dart';
import 'package:oeroen/presentation/widgets/app_primary_button.dart';
import 'package:oeroen/utils/int_extensions.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 32,
                    top: 32,
                  ),
                  child: AppBackButton(onPressed: () {
                    Get.back();
                  }),
                ),
                SvgPicture.asset("assets/images/register_illust.svg"),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 32),
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Lupa Kata Sandi",
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 32,
                          fontFamily: AppFont.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Jangan khawatir, anda dapat mengubah kata sandi anda dengan mengisi email di bawah",
                        style: TextStyle(
                          color: AppColor.light,
                          fontSize: 14,
                          fontFamily: AppFont.medium,
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
                        FormBuilderTextField(
                          name: "email",
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(
                            color: AppColor.light,
                            fontSize: 14,
                            fontFamily: AppFont.medium,
                          ),
                          decoration: InputDecoration(
                            hintText: "Masukkan Email",
                            hintStyle: const TextStyle(
                              color: AppColor.gray,
                              fontSize: 14,
                              fontFamily: AppFont.regular,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: AppColor.primary),
                            ),
                            filled: true,
                            fillColor: AppColor.darker,
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.email(),
                          ]),
                        ),
                        const SizedBox(height: 32),
                        AppPrimaryButton(
                          text: "Kirim Email",
                          onPressed: () {
                            controller.forgotPassword("");
                          },
                        ),
                        const SizedBox(height: 48),
                        Obx(
                          () => RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                color: AppColor.light,
                                fontSize: 14,
                                fontFamily: AppFont.medium,
                              ),
                              children: [
                                const TextSpan(
                                  text: "Belum menerima email?  ",
                                ),
                                TextSpan(
                                    text: controller.timeout.value > 0
                                        ? controller.timeout.value.formatTimer()
                                        : "Kirim Ulang",
                                    style: const TextStyle(
                                      color: AppColor.accent,
                                      fontFamily: AppFont.semiBold,
                                    ),
                                    recognizer: controller.timeout.value > 0
                                        ? null
                                        : TapGestureRecognizer()
                                      ?..onTap = () {
                                        controller.forgotPassword("");
                                      }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
