import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/features/auth/presentation/application/user_sign_controller.dart';
import 'package:oeroen/presentation/widgets/app_fill_button.dart';
import 'package:oeroen/presentation/widgets/app_text_button.dart';
import 'package:oeroen/presentation/widgets/app_text_field.dart';
import 'package:oeroen/routes/app_route.dart';

class LoginEmailScreen extends StatelessWidget {
  const LoginEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
    final controller = Get.find<UserSignController>();

    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: FormBuilder(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        autoFocusOnValidationFailure: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                const SizedBox(height: 24),
                AppTextField(
                  name: "password",
                  hintText: "Kata Sandi",
                  prefix: SvgPicture.asset(
                    "assets/icons/ic_password.svg",
                    width: 16,
                    height: 16,
                    color: AppColor.gray,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  action: TextInputAction.done,
                  obscure: true,
                  validators: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(8),
                    FormBuilderValidators.match(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$',
                    ),
                  ]),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: AppTextButton(
                    text: "Lupa Kata Sandi",
                    onPressed: () {
                      Get.toNamed(AppRoute.forgotPasswordRoute);
                    },
                  ),
                ),
                const SizedBox(height: 64),
                AppFillButton(
                  text: "Masuk",
                  onPressed: () {
                    if (formKey.currentState!.saveAndValidate()) {
                      controller.login(
                        email: formKey.currentState!.value['email'],
                        password: formKey.currentState!.value['password'],
                      );
                    }
                  },
                ),
              ],
            ),
            AppTextButton(
              text: "Belum punya Akun",
              onPressed: () {
                Get.offNamed(AppRoute.registerRoute);
              },
            ),
          ],
        ),
      ),
    );
  }
}
