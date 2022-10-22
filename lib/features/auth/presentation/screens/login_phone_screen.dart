import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/presentation/widgets/app_fill_button.dart';
import 'package:oeroen/presentation/widgets/app_text_button.dart';
import 'package:oeroen/presentation/widgets/app_text_field.dart';
import 'package:oeroen/routes/app_route.dart';

class LoginPhoneScreen extends StatelessWidget {
  const LoginPhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: FormBuilder(
        key: formKey,
        autovalidateMode: AutovalidateMode.disabled,
        autoFocusOnValidationFailure: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/indo_flag.svg",
                            height: 16,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "+62",
                            style: TextStyle(
                              color: AppColor.black,
                              fontSize: 12,
                              fontFamily: AppFont.semiBold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AppTextField(
                        name: "phone",
                        hintText: "Nomor Handphone Anda",
                        keyboardType: TextInputType.phone,
                        action: TextInputAction.done,
                        validators: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 64),
                AppFillButton(
                  text: "Masuk",
                  onPressed: () {
                    formKey.currentState?.validate();
                  },
                ),
              ],
            ),
            AppTextButton(
              text: "Belum punya Akun",
              onPressed: () {
                Get.rootDelegate.toNamed(
                  "${AppRoute.authRoute}/${AppRoute.loginEmailRoute}",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
