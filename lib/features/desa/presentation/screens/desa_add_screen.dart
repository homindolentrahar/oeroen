import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/presentation/widgets/core_app_bar.dart';
import 'package:oeroen/presentation/widgets/app_fill_button.dart';
import 'package:oeroen/presentation/widgets/app_text_button.dart';
import 'package:oeroen/presentation/widgets/app_text_field.dart';

class DesaAddScreen extends StatelessWidget {
  const DesaAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CoreAppBar(
                title: 'Tambah Desa',
                backEnabled: true,
              ),
              const SizedBox(height: 64),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    const Text(
                      "Daftar Desa",
                      style: TextStyle(
                        fontFamily: AppFont.semiBold,
                        fontSize: 32,
                        color: AppColor.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Masukkan kode unik Desa, agar kamu dapat menikmati layanan Oeroen di Desamu",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.dark,
                      ),
                    ),
                    const SizedBox(height: 32),
                    FormBuilder(
                      // key: controller.formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      autoFocusOnValidationFailure: true,
                      child: Column(
                        children: [
                          PinTextField(
                            // controller: controller.textEditingController,
                            name: "unique_code",
                            onChanged: (value) {},
                            onCompleted: (value) {
                              // controller.checkDesaExists(value);
                              // controller.resetFormState();
                            },
                          ),
                          const SizedBox(height: 64),
                          AppFillButton(
                            text: "Kirim",
                            onPressed: () {
                              // if (controller.isFormValid()) {
                              //   final desaCode =
                              //   controller.getFormFieldData("unique_code");
                              //   controller.checkDesaExists(desaCode);
                              //   controller.resetFormState();
                              // }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
