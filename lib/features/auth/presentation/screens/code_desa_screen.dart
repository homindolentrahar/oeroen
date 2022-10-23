import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/presentation/widgets/app_fill_button.dart';
import 'package:oeroen/presentation/widgets/app_text_field.dart';

class CodeDesaScreen extends StatelessWidget {
  const CodeDesaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
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
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Kode Desa",
                    style: TextStyle(
                      fontFamily: AppFont.semiBold,
                      fontSize: 32,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Masukkan 6 digit kode desa tempat dimana kamu tinggal",
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
                    PinTextField(
                      name: "code-desa",
                      onChanged: (value) {},
                      onCompleted: (value) {},
                    ),
                    const SizedBox(height: 64),
                    AppFillButton(
                      text: "Kirim",
                      onPressed: () {
                        formKey.currentState?.validate();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: AppColor.dark,
                      fontSize: 14,
                      fontFamily: AppFont.regular,
                    ),
                    children: [
                      const TextSpan(text: "Tidak tahu kode desamu? "),
                      TextSpan(
                        text: "Cari Tahu",
                        style: TextStyle(
                          color: Get.theme.primaryColor,
                          fontFamily: AppFont.semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
