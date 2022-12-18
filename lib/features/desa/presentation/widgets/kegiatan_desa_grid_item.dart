import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';
import 'package:oeroen/utils/extension/int_extensions.dart';

class KegiatanDesaGridItem extends StatelessWidget {
  const KegiatanDesaGridItem({
    Key? key,
    required this.activity,
    required this.onPressed,
  }) : super(key: key);

  final DesaActivity activity;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final iuranCategory = Constants.iuranCategories.firstWhere(
        (element) => element.categorySlug == activity.iuranCategory);

    return SizedBox(
      width: 172,
      child: Material(
        color: AppColor.light,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(16),
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset(
                        iuranCategory.categoryIcon ?? "",
                        width: 20,
                        height: 20,
                        color: AppColor.dark,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      iuranCategory.categoryName ?? "",
                      style: Get.textTheme.bodyText1?.copyWith(
                        color: AppColor.dark,
                        fontFamily: AppFont.medium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activity.name ?? "",
                        style: Get.textTheme.bodyText1?.copyWith(
                          color: AppColor.black,
                          fontFamily: AppFont.semiBold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        (activity.scheduleDays?.isEmpty ?? true)
                            ? "Tidak ada Hari"
                            : (activity.scheduleDays?.length ?? 0) >= 7
                                ? "Setiap Hari"
                                : "${activity.scheduleDays?.map((e) => e.getDayName()).join(", ")}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.bodyText2?.copyWith(
                          color: AppColor.dark,
                          fontFamily: AppFont.medium,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${activity.startTimeIn24h} - ${activity.endTimeIn24h}",
                        style: Get.textTheme.bodyText2?.copyWith(
                          color: AppColor.gray,
                          fontFamily: AppFont.medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
