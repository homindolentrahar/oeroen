import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/domain/models/warga.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';

class WargaDesaListItem extends StatelessWidget {
  const WargaDesaListItem({
    super.key,
    required this.data,
    required this.onPressed,
    this.isSelected = false,
  });

  final bool isSelected;
  final WargaDesa data;
  final ValueChanged<WargaDesa> onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? Get.theme.primaryColor : AppColor.light,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () => onPressed(data),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColor.white.withOpacity(0.15)
                      : AppColor.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  "assets/icons/ic_desa.svg",
                  color: isSelected
                      ? AppColor.white.withOpacity(0.75)
                      : AppColor.dark,
                  width: 16,
                  height: 16,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name ?? "",
                      style: Get.textTheme.headline5?.copyWith(
                        color: isSelected ? AppColor.white : AppColor.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      data.uniqueCode ?? "",
                      style: Get.textTheme.bodyText2?.copyWith(
                        color: isSelected ? AppColor.light : AppColor.dark,
                        fontFamily: AppFont.medium,
                      ),
                    )
                  ],
                ),
              ),
              if (isSelected) ...[
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColor.white.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(360),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/ic_check.svg",
                    color: AppColor.white,
                    width: 12,
                    height: 12,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class DesaListItem extends StatelessWidget {
  const DesaListItem({
    super.key,
    required this.data,
    required this.onPressed,
    this.isSelected = false,
  });

  final bool isSelected;
  final Desa data;
  final ValueChanged<Desa> onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? Get.theme.primaryColor : AppColor.light,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () => onPressed(data),
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.all(16),
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColor.white.withOpacity(0.15)
                      : AppColor.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  "assets/icons/ic_desa.svg",
                  color: isSelected
                      ? AppColor.white.withOpacity(0.75)
                      : AppColor.dark,
                  width: 16,
                  height: 16,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.name ?? "",
                      style: Get.textTheme.headline5?.copyWith(
                        color: isSelected ? AppColor.white : AppColor.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      data.uniqueCode ?? "",
                      style: Get.textTheme.bodyText2?.copyWith(
                        color: isSelected ? AppColor.light : AppColor.dark,
                        fontFamily: AppFont.medium,
                      ),
                    )
                  ],
                ),
              ),
              if (isSelected) ...[
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColor.white.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(360),
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/ic_check.svg",
                    color: AppColor.white,
                    width: 12,
                    height: 12,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
