import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';

class TransaksiDesaListItem extends StatelessWidget {
  const TransaksiDesaListItem({Key? key, required this.onPressed})
      : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.light,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  "assets/icons/ic_keamanan.svg",
                  width: 20,
                  height: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Keamanan",
                      style: TextStyle(
                        color: AppColor.black,
                        fontSize: 16,
                        fontFamily: AppFont.semiBold,
                      ),
                    ),
                    Text(
                      "12:40 • 12 Mei 2022",
                      style: TextStyle(
                        color: AppColor.gray,
                        fontSize: 12,
                        fontFamily: AppFont.regular,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Text(
                "25.000",
                style: TextStyle(
                  color: Get.theme.primaryColor,
                  fontSize: 14,
                  fontFamily: AppFont.semiBold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
