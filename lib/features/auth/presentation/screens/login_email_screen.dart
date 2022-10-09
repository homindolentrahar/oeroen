import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/presentation/widgets/app_primary_button.dart';
import 'package:oeroen/routes/app_route.dart';

class LoginEmailScreen extends StatelessWidget {
  const LoginEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: SvgPicture.asset("assets/images/login_illust.svg"),
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
                    "Masuk",
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 32,
                      fontFamily: AppFont.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Urunan dari mana saja, kapan saja, cukup dengan sentuhan jari",
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
                          borderSide: const BorderSide(color: AppColor.primary),
                        ),
                        filled: true,
                        fillColor: AppColor.darker,
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                    const SizedBox(height: 16),
                    FormBuilderTextField(
                      name: "password",
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      style: const TextStyle(
                        color: AppColor.light,
                        fontSize: 14,
                        fontFamily: AppFont.medium,
                      ),
                      decoration: InputDecoration(
                        hintText: "Masukkan Kata Sandi",
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
                          borderSide: const BorderSide(color: AppColor.primary),
                        ),
                        filled: true,
                        fillColor: AppColor.darker,
                        suffixIcon: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          child: GestureDetector(
                            child: SvgPicture.asset(
                              "assets/icons/password_field.svg",
                              color: AppColor.gray,
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                        suffixIconConstraints: const BoxConstraints(
                          minWidth: 0,
                          minHeight: 0,
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(8),
                      ]),
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        child: const Text(
                          "Lupa Kata Sandi",
                          style: TextStyle(
                            color: AppColor.primary,
                            fontSize: 12,
                            fontFamily: AppFont.bold,
                          ),
                        ),
                        onTap: () {
                          Get.toNamed(AppRoute.forgotPasswordRoute);
                        },
                      ),
                    ),
                    const SizedBox(height: 32),
                    AppPrimaryButton(
                      text: "Masuk",
                      onPressed: () {
                        Get.offNamed(AppRoute.mainRoute);
                      },
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      child: const Text(
                        "Masuk dengan Handphone",
                        style: TextStyle(
                          color: AppColor.primary,
                          fontSize: 16,
                          fontFamily: AppFont.bold,
                        ),
                      ),
                      onTap: () {
                        Get.rootDelegate.toNamed(
                          "${AppRoute.authRoute}/${AppRoute.loginPhoneRoute}",
                        );
                      },
                    ),
                    const SizedBox(height: 48),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: AppColor.light,
                          fontSize: 14,
                          fontFamily: AppFont.medium,
                        ),
                        children: [
                          const TextSpan(
                            text: "Belum memiliki akun?  ",
                          ),
                          TextSpan(
                            text: "Buat Akun",
                            style: const TextStyle(
                              color: AppColor.accent,
                              fontFamily: AppFont.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(AppRoute.registerRoute);
                              },
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
      ],
    );
  }
}
