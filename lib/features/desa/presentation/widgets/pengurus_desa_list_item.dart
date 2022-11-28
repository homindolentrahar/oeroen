import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/presentation/widgets/image_load.dart';

class PengurusDesaListItem extends StatelessWidget {
  const PengurusDesaListItem({Key? key, required this.onPressed})
      : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ImageLoad(
            image: "assets/images/profile.png",
            width: 48,
            height: 48,
            radius: 360,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Joseph Stalin",
                  style: Get.textTheme.headline5?.copyWith(
                    color: AppColor.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Bendahara RT",
                  style: Get.textTheme.bodyText2?.copyWith(
                    color: AppColor.gray,
                    fontFamily: AppFont.medium,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Material(
            color: Get.theme.primaryColor.withOpacity(0.25),
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.transparent,
                child: SvgPicture.asset(
                  "assets/icons/ic_hubungi.svg",
                  width: 16,
                  height: 16,
                  color: Get.theme.primaryColor.withOpacity(0.75),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
