import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/routes/app_route.dart';

class LoginPhoneScreen extends StatelessWidget {
  const LoginPhoneScreen({Key? key}) : super(key: key);

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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/indo_flag.svg",
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "+62",
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 12,
                                  fontFamily: AppFont.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: FormBuilderTextField(
                            name: "phone",
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.done,
                            style: const TextStyle(
                              color: AppColor.light,
                              fontSize: 14,
                              fontFamily: AppFont.medium,
                            ),
                            decoration: InputDecoration(
                              hintText: "Masukkan Nomor Handphone",
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
                              FormBuilderValidators.numeric(),
                            ]),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: AppColor.primary,
                      child: const Text(
                        "Masuk",
                        style: TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontFamily: AppFont.bold,
                        ),
                      ),
                      onPressed: () {
                        Get.offAllNamed(AppRoute.mainRoute);
                      },
                    ),
                    const SizedBox(height: 24),
                    GestureDetector(
                      child: const Text(
                        "Masuk dengan Email",
                        style: TextStyle(
                          color: AppColor.primary,
                          fontSize: 16,
                          fontFamily: AppFont.bold,
                        ),
                      ),
                      onTap: () {
                        Get.rootDelegate.toNamed(
                          "${AppRoute.authRoute}/${AppRoute.loginEmailRoute}",
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
                                }),
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
