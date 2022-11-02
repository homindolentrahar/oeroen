import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/domain/models/iuran_category.dart';
import 'package:oeroen/core/presentation/application/iuran_filter_controller.dart';

final List<IuranCategory> filterCategories = [
  IuranCategory(
    categorySlug: "kebersihan",
    categoryName: "Kebersihan",
    categoryIcon: "assets/icons/ic_kebersihan.svg",
  ),
  IuranCategory(
    categorySlug: "keamanan",
    categoryName: "Keamanan",
    categoryIcon: "assets/icons/ic_keamanan.svg",
  ),
  IuranCategory(
    categorySlug: "kas",
    categoryName: "Kas",
    categoryIcon: "assets/icons/ic_kas.svg",
  ),
  IuranCategory(
    categorySlug: "arisan",
    categoryName: "Arisan",
    categoryIcon: "assets/icons/ic_arisan.svg",
  ),
  IuranCategory(
    categorySlug: "sosial",
    categoryName: "Sosial",
    categoryIcon: "assets/icons/ic_sosial.svg",
  ),
  IuranCategory(
    categorySlug: "donasi",
    categoryName: "Donasi",
    categoryIcon: "assets/icons/ic_donasi.svg",
  ),
];

class IuranFilterCategory extends StatelessWidget {
  final IuranCategory? category;

  const IuranFilterCategory({Key? key, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<IuranFilterController>();

    return SizedBox(
      height: 72,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,

        itemCount: filterCategories.length,
        itemBuilder: (ctx, index) {
          final item = filterCategories[index];
          return IuranFilterCategoryItem(
            category: item,
            selected: item.categorySlug == category?.categorySlug,
            onSelect: (category) {
              controller.selectCategory(category);
            },
          );
        },
        separatorBuilder: (ctx, index) {
          return const SizedBox(width: 16);
        },
      ),
    );
  }
}

class IuranFilterCategoryItem extends StatelessWidget {
  final IuranCategory? category;
  final bool selected;
  final ValueChanged<IuranCategory?> onSelect;

  const IuranFilterCategoryItem({
    Key? key,
    this.category,
    required this.selected,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          color: selected ? Get.theme.primaryColor : AppColor.light,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: () => onSelect(category),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                category?.categoryIcon ?? "",
                width: 20,
                height: 20,
                color: selected ? AppColor.white : AppColor.gray,
              ),
            ),
          ),
        ),
        if (selected) ...[
          const SizedBox(height: 8),
          Text(
            category?.categoryName ?? "",
            style: TextStyle(
              color: Get.theme.primaryColor,
              fontSize: 12,
              fontFamily: AppFont.semiBold,
            ),
          ),
        ]
      ],
    );
  }
}
