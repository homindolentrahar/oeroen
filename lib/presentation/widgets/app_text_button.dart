import 'package:flutter/material.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final double textSize;
  final VoidCallback onPressed;

  const AppTextButton({
    Key? key,
    required this.text,
    this.textSize = 14,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: AppColor.primary,
          fontSize: textSize,
          fontFamily: AppFont.semiBold,
        ),
      ),
    );
  }
}
