import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/presentation/widgets/app_primary_button.dart';
import 'package:oeroen/routes/app_routes.dart';

class RegisterScreen extends StatefulWidget {
  static const route = "/register";

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                  child: MaterialButton(
                    minWidth: 40,
                    height: 40,
                    color: AppColor.dark,
                    padding: const EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.transparent),
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/back.svg",
                      color: AppColor.white,
                    ),
                    onPressed: () {
                      context.router.navigateBack();
                    },
                  ),
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
                        "Daftar",
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 32,
                          fontFamily: AppFont.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Bergabung bersama layanan urun yang praktis dan transparan",
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
                          name: "name",
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          style: const TextStyle(
                            color: AppColor.light,
                            fontSize: 14,
                            fontFamily: AppFont.medium,
                          ),
                          decoration: InputDecoration(
                            hintText: "Masukkan Nama Lengkap",
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
                            FormBuilderValidators.minLength(3),
                          ]),
                        ),
                        const SizedBox(height: 16),
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
                              borderSide:
                                  const BorderSide(color: AppColor.primary),
                            ),
                            filled: true,
                            fillColor: AppColor.darker,
                            suffixIcon: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
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
                        const SizedBox(height: 32),
                        AppPrimaryButton(
                          text: "Daftar",
                          onPressed: () {
                            context.router.replaceAll([const UrunanRoute()]);
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
                                text: "Sudah memiliki akun?  ",
                              ),
                              TextSpan(
                                  text: "Masuk Akun",
                                  style: const TextStyle(
                                    color: AppColor.accent,
                                    fontFamily: AppFont.bold,
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
