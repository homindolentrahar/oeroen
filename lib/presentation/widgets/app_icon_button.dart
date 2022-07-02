import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oeroen/common/theme/app_color.dart';

class AppIconButton extends StatelessWidget {
  final String icon;
  final Color iconColor;
  final double iconSize;
  final VoidCallback onPressed;

  const AppIconButton({
    Key? key,
    required this.icon,
    this.iconColor = AppColor.light,
    this.iconSize = 16,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 40,
      height: 40,
      color: AppColor.dark,
      padding: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.transparent),
      ),
      onPressed: onPressed,
      child: SvgPicture.asset(
        icon,
        width: iconSize,
        height: iconSize,
        color: iconColor,
      ),
    );
  }
}
