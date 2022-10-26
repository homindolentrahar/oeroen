import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/auth/presentation/application/user_sign_controller.dart';
import 'package:oeroen/presentation/widgets/app_fill_button.dart';
import 'package:oeroen/presentation/widgets/app_text_button.dart';
import 'package:oeroen/presentation/widgets/app_text_field.dart';
import 'package:oeroen/routes/app_route.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
    final controller = Get.find<UserSignController>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(32),
          physics: const BouncingScrollPhysics(),
          children: [
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
                  "Halo Kamu!",
                  style: TextStyle(
                    fontFamily: AppFont.semiBold,
                    fontSize: 32,
                    color: AppColor.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Agar kita dapat lebih mengenal, yuk gabung dengan ratusan warga yang melek digital",
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
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    onChanged: (value) {},
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
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 64),
                  AppFillButton(
                    text: "Daftar",
                    onPressed: () {
                      if (formKey.currentState!.saveAndValidate()) {
                        controller.register(
                          email: formKey.currentState!.value['email'],
                          password: formKey.currentState!.value['password'],
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 32),
                  Divider(
                    thickness: 2,
                    color: AppColor.gray.withOpacity(0.25),
                    indent: 64,
                    endIndent: 64,
                  ),
                  const SizedBox(height: 24),
                  AppFillButton(
                    icon: SvgPicture.asset(
                      "assets/icons/ic_google.svg",
                      width: 24,
                      height: 24,
                    ),
                    text: "Masuk dengan Google",
                    textSize: 14,
                    textColor: AppColor.black,
                    color: AppColor.white,
                    onPressed: () {
                      controller.googleLogin();
                    },
                  ),
                  const SizedBox(height: 64),
                  AppTextButton(
                    text: "Sudah punya Akun",
                    onPressed: () {
                      Get.offNamed(AppRoute.authRoute);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
