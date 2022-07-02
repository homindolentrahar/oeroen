import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  static const route = "/login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final logins = [
      _LoginEmail(
        pageController: _pageController,
      ),
      _LoginPhone(
        pageController: _pageController,
      ),
    ];

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
                itemCount: logins.length,
                itemBuilder: (ctx, index) {
                  return logins[index];
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
  final PageController pageController;

  const _LoginPhone({Key? key, required this.pageController}) : super(key: key);

  @override
  State<_LoginPhone> createState() => _LoginPhoneState();
}

class _LoginPhoneState extends State<_LoginPhone> {
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/indo_flag.svg",
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "+62",
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 12,
                            fontFamily: AppFont.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: FormBuilderTextField(
                      name: "phone",
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      style: const TextStyle(
                        color: AppColor.light,
                        fontSize: 14,
                        fontFamily: AppFont.medium,
                      ),
                      decoration: InputDecoration(
                        hintText: "Masukkan Nomor Handphone",
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
                          borderSide: const BorderSide(color: AppColor.primary),
                        ),
                        filled: true,
                        fillColor: AppColor.darker,
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                      ]),
                    ),
                  ),
                ],
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
                  "Masuk dengan Email",
                  style: TextStyle(
                    color: AppColor.primary,
                    fontSize: 16,
                    fontFamily: AppFont.bold,
                  ),
                ),
                onTap: () {
                  widget.pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
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
                      text: "Belum memiliki akun?  ",
                    ),
                    TextSpan(
                        text: "Buat Akun",
                        style: const TextStyle(
                          color: AppColor.accent,
                          fontFamily: AppFont.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context.router.push(const RegisterRoute());
                          }),
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

class _LoginEmail extends StatefulWidget {
  final PageController pageController;

  const _LoginEmail({Key? key, required this.pageController}) : super(key: key);

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
                  FormBuilderValidators.minLength(8),
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
                  "Masuk dengan Handphone",
                  style: TextStyle(
                    color: AppColor.primary,
                    fontSize: 16,
                    fontFamily: AppFont.bold,
                  ),
                ),
                onTap: () {
                  widget.pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
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
                      text: "Belum memiliki akun?  ",
                    ),
                    TextSpan(
                      text: "Buat Akun",
                      style: const TextStyle(
                        color: AppColor.accent,
                        fontFamily: AppFont.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.router.push(const RegisterRoute());
                        },
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
