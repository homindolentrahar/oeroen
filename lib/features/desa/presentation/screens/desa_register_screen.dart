import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/desa/presentation/application/desa_register_controller.dart';
import 'package:oeroen/presentation/widgets/app_fill_button.dart';
import 'package:oeroen/presentation/widgets/app_text_button.dart';
import 'package:oeroen/presentation/widgets/app_text_field.dart';
import 'package:oeroen/routes/app_route.dart';

class DesaRegisterScreen extends GetView<DesaRegisterController> {
  const DesaRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.light,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: AppTextButton(
                      reversed: true,
                      text: "Lewati",
                      textColor: AppColor.dark,
                      icon: SvgPicture.asset(
                        "assets/icons/ic_chevron_right.svg",
                        width: 20,
                        height: 20,
                        color: AppColor.dark,
                      ),
                      onPressed: () {
                        Get.offAllNamed(AppRoute.mainRoute);
                      },
                    ),
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
                        "Daftar Desa",
                        style: TextStyle(
                          fontFamily: AppFont.semiBold,
                          fontSize: 32,
                          color: AppColor.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Masukkan kode unik Desa, agar kamu dapat menikmati layanan Oeroen di Desamu",
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
                      children: [
                        PinTextField(
                          controller: controller.textEditingController,
                          name: "unique_code",
                          onChanged: (value) {},
                          onCompleted: (value) {
                            controller.checkDesaExists(value);
                            controller.resetFormState();
                          },
                        ),
                        const SizedBox(height: 64),
                        AppFillButton(
                          text: "Kirim",
                          onPressed: () {
                            if (controller.isFormValid()) {
                              final desaCode =
                                  controller.getFormFieldData("unique_code");
                              controller.checkDesaExists(desaCode);
                              controller.resetFormState();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              AppTextButton(
                text: "Cari tahu Kode Unik",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
