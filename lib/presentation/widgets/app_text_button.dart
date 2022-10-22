import 'package:flutter/material.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Widget? icon;
  final double textSize;
  final VoidCallback onPressed;

  const AppTextButton({
    Key? key,
    required this.text,
    this.textColor = AppColor.primary,
    this.icon,
    this.textSize = 14,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: textSize,
              fontFamily: AppFont.semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
