import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';

class LoginScreen extends StatefulWidget {
  static const route = "/login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _pageController = PageController();
  final _logins = [const _LoginEmail(), const _LoginPhone()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset("assets/images/login_illust.svg"),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                allowImplicitScrolling: false,
                itemCount: _logins.length,
                itemBuilder: (ctx, index) {
                  return _logins[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginPhone extends StatefulWidget {
  const _LoginPhone({Key? key}) : super(key: key);

  @override
  State<_LoginPhone> createState() => _LoginPhoneState();
}

class _LoginPhoneState extends State<_LoginPhone> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _LoginEmail extends StatefulWidget {
  const _LoginEmail({Key? key}) : super(key: key);

  @override
  State<_LoginEmail> createState() => _LoginEmailState();
}

class _LoginEmailState extends State<_LoginEmail> {
  late GlobalKey<FormBuilderState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormBuilderState>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColor.primary),
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
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: AppColor.primary),
                  ),
                  filled: true,
                  fillColor: AppColor.darker,
                  suffixIcon: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
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
                  FormBuilderValidators.email(),
                ]),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: const Text(
                    "Lupa Kata Sandi",
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: 12,
                      fontFamily: AppFont.bold,
                    ),
                  ),
                  onTap: () {},
                ),
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
                onPressed: () {},
              ),
              const SizedBox(height: 24),
              GestureDetector(
                child: const Text(
                  "Masuk dengan No.Handphone",
                  style: TextStyle(
                    color: AppColor.primary,
                    fontSize: 16,
                    fontFamily: AppFont.bold,
                  ),
                ),
                onTap: () {},
              ),
              const SizedBox(height: 48),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: AppColor.light,
                    fontSize: 14,
                    fontFamily: AppFont.medium,
                  ),
                  children: [
                    TextSpan(
                      text: "Belum memiliki akun?  ",
                    ),
                    TextSpan(
                      text: "Buat Akun",
                      style: TextStyle(
                        color: AppColor.accent,
                        fontFamily: AppFont.bold,
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
