import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/auth/presentation/application/admin_auth_controller.dart';
import 'package:oeroen/presentation/widgets/app_fill_button.dart';
import 'package:oeroen/presentation/widgets/app_text_field.dart';

class AdmminAuthScreen extends StatelessWidget {
  const AdmminAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.light,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: GetBuilder<AdminAuthController>(
            builder: (controller) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/icons/logo.svg",
                    width: 48,
                    height: 48,
                  ),
                  const SizedBox(height: 32),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Halo Pengurus Desa!",
                        style: TextStyle(
                          fontFamily: AppFont.semiBold,
                          fontSize: 32,
                          color: AppColor.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Yuk mulai membuat iuran desamu menjadi lebih mudah dan cepat!",
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColor.dark,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  FormBuilder(
                    key: controller.formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                      FormBuilderValidators.match(
                                        r'^8[1-9][0-9]{7,10}$',
                                      ),
                                    ]),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 64),
                            AppFillButton(
                              text: "Masuk",
                              onPressed: () {
                                if (controller.formKey.currentState!
                                    .saveAndValidate()) {
                                  final phone = controller
                                      .formKey.currentState!.value['phone'];
                                  controller.verifyPhoneNumber(phone);
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
