import 'package:flutter/material.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';

class AppFillButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final Color color;
  final double textSize;
  final Color textColor;
  final VoidCallback onPressed;

  const AppFillButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.color = AppColor.primary,
    this.textSize = 16,
    this.textColor = AppColor.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      highlightElevation: 0,
      focusElevation: 0,
      color: color,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            icon!,
            const SizedBox(width: 16),
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
