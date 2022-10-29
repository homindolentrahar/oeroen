import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AppTextField extends StatelessWidget {
  final String name;
  final String hintText;
  final Widget? prefix;
  final TextInputType keyboardType;
  final TextInputAction action;
  final int maxLines;
  final bool obscure;
  final FormFieldValidator<String>? validators;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String?>? onChanged;

  const AppTextField({
    Key? key,
    required this.name,
    required this.hintText,
    this.prefix,
    this.keyboardType = TextInputType.text,
    this.action = TextInputAction.done,
    this.maxLines = 1,
    this.obscure = false,
    this.validators,
    this.inputFormatters,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      maxLines: maxLines,
      keyboardType: keyboardType,
      textInputAction: action,
      style: const TextStyle(
        color: AppColor.black,
        fontSize: 14,
        fontFamily: AppFont.medium,
      ),
      obscureText: obscure,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColor.gray,
          fontSize: 14,
          fontFamily: AppFont.regular,
        ),
        prefixIcon: Align(
          alignment: Alignment.center,
          child: prefix,
        ),
        prefixIconConstraints: prefix == null
            ? const BoxConstraints(maxWidth: 16, maxHeight: 16)
            : const BoxConstraints(
                maxWidth: 40,
                maxHeight: 40,
              ),
        contentPadding: const EdgeInsets.all(16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColor.primary,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColor.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColor.red,
            width: 1.5,
          ),
        ),
        filled: true,
        fillColor: AppColor.white,
      ),
      validator: validators,
      inputFormatters: inputFormatters,
    );
  }
}

class PinTextField extends StatelessWidget {
  final String name;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onCompleted;

  const PinTextField({
    Key? key,
    required this.name,
    this.keyboardType = TextInputType.text,
    required this.onChanged,
    this.onCompleted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: name,
      builder: (field) {
        return PinCodeTextField(
          appContext: context,
          length: 6,
          obscureText: false,
          keyboardType: keyboardType,
          animationType: AnimationType.fade,
          enableActiveFill: true,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            inactiveFillColor: AppColor.white,
            activeFillColor: AppColor.white,
            selectedFillColor: AppColor.white,
            inactiveColor: AppColor.gray.withOpacity(0.25),
            activeColor: Get.theme.primaryColor,
            borderWidth: 1,
            borderRadius: BorderRadius.circular(8),
          ),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(),
            FormBuilderValidators.numeric(),
          ]),
          errorTextSpace: 32,
          onChanged: onChanged,
          onCompleted: onCompleted,
        );
      },
    );
  }
}
