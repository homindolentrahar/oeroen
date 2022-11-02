import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/domain/models/iuran_sort.dart';
import 'package:oeroen/core/presentation/application/iuran_filter_controller.dart';

final List<IuranSort> filterSorts = [
  IuranSort(
    sortName: "Nominal Tertinggi",
    sortSlug: "amount_desc",
  ),
  IuranSort(
    sortName: "Nominal Terendah",
    sortSlug: "amount_asc",
  ),
  IuranSort(
    sortName: "Terbaru",
    sortSlug: "latest",
  ),
  IuranSort(
    sortName: "Terlama",
    sortSlug: "oldest",
  ),
];

class IuranFilterSort extends StatelessWidget {
  final IuranSort? sort;

  const IuranFilterSort({
    Key? key,
    this.sort,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<IuranFilterController>();

    return FormBuilderField(
      name: 'filter_sort',
      initialValue: sort,
      builder: (field) {
        return Wrap(
          spacing: 8,
          runSpacing: 8,
          children: filterSorts
              .map(
                (item) => IuranFilterSortChip(
                  sort: item,
                  selected: item.sortSlug == sort?.sortSlug,
                  onSelect: (sort) {
                    controller.selectSort(sort);
                  },
                ),
              )
              .toList(),
        );
      },
      valueTransformer: (sort) {},
    );
  }
}

class IuranFilterSortChip extends StatelessWidget {
  final IuranSort? sort;
  final bool selected;
  final ValueChanged<IuranSort?> onSelect;

  const IuranFilterSortChip({
    Key? key,
    this.sort,
    this.selected = false,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: selected ? Get.theme.primaryColor : AppColor.light,
      child: InkWell(
        onTap: () => onSelect(sort),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            sort?.sortName ?? "",
            style: TextStyle(
              color: selected ? AppColor.white : AppColor.gray,
              fontSize: 12,
              fontFamily: selected ? AppFont.semiBold : AppFont.medium,
            ),
          ),
        ),
      ),
    );
  }
}