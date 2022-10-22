import 'package:flutter/material.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';

class AppFillButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppFillButton(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      color: AppColor.primary,
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          color: AppColor.white,
          fontSize: 16,
          fontFamily: AppFont.semiBold,
        ),
      ),
    );
  }
}
