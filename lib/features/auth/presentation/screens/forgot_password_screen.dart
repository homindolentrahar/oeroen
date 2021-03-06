import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_route/auto_route.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/presentation/widgets/app_back_button.dart';
import 'package:oeroen/presentation/widgets/app_primary_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const route = "/forgot-password";

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late GlobalKey<FormBuilderState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormBuilderState>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    context.router.navigateBack();
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
                    key: _formKey,
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
                          onPressed: () {},
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
                                text: "Belum menerima email?  ",
                              ),
                              TextSpan(
                                  text: "00:50",
                                  style: const TextStyle(
                                    color: AppColor.accent,
                                    fontFamily: AppFont.semiBold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.router.navigateBack();
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
        ),
      ),
    );
  }
}
