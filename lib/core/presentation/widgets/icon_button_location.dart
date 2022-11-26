import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class IconButtonLocation extends StatelessWidget {
  const IconButtonLocation({Key? key, required this.onPressed})
      : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Get.theme.primaryColor.withOpacity(0.25),
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset(
            "assets/icons/ic_location.svg",
            width: 16,
            height: 16,
            color: Get.theme.primaryColor.withOpacity(0.75),
          ),
        ),
      ),
    );
  }
}
