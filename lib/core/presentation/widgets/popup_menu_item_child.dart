import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';

class PopupMenuItemChild extends StatelessWidget {
  final String? icon;
  final String title;
  final Color? textColor;

  const PopupMenuItemChild({
    Key? key,
    this.icon,
    required this.title,
    this.textColor = AppColor.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            SvgPicture.asset(
              icon!,
              width: 16,
              height: 16,
              color: textColor,
            ),
            const SizedBox(width: 8)
          ],
          Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              fontFamily: AppFont.medium,
            ),
          ),
        ],
      ),
    );
  }
}
