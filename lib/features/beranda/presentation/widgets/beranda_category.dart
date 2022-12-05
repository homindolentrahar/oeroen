import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_category.dart';
import 'package:oeroen/routes/app_route.dart';

class BerandaCategoryTiles extends StatelessWidget {
  const BerandaCategoryTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: Constants.iuranCategories.length,
        separatorBuilder: (ctx, index) => const SizedBox(width: 32),
        itemBuilder: (ctx, index) =>
            BerandaCategoryTileItem(item: Constants.iuranCategories[index]),
      ),
    );
  }
}

class BerandaCategoryTileItem extends StatelessWidget {
  final IuranCategory item;

  const BerandaCategoryTileItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          AppRoute.iuranListRoute,
          arguments: {
            "title": "Iuran ${item.categoryName}",
          },
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColor.light,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              item.categoryIcon ?? "",
              width: 20,
              height: 20,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.categoryName ?? "",
            style: const TextStyle(
              color: AppColor.dark,
              fontSize: 12,
              fontFamily: AppFont.regular,
            ),
          ),
        ],
      ),
    );
  }
}
