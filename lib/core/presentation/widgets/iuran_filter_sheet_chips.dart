import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_filter.dart';

class IuranFilterSheetChips extends StatelessWidget {
  const IuranFilterSheetChips({
    Key? key,
    required this.initialValue,
    required this.filters,
    required this.onSelect,
  }) : super(key: key);

  final IuranFilter? initialValue;
  final List<IuranFilter> filters;
  final ValueChanged<IuranFilter?> onSelect;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: filters
          .map(
            (item) => item.type == IuranFilterType.sort
                ? IuranFilterSheetChipSort(
                    data: item,
                    selected: item.slug == initialValue?.slug,
                    onSelect: onSelect,
                  )
                : IuranFilterSheetChipPaid(
                    data: item,
                    selected: item.slug == initialValue?.slug,
                    onSelect: onSelect,
                  ),
          )
          .toList(),
    );
  }
}

class IuranFilterSheetChipSort extends StatelessWidget {
  final IuranFilter data;
  final bool selected;
  final ValueChanged<IuranFilter> onSelect;

  const IuranFilterSheetChipSort({
    Key? key,
    required this.data,
    this.selected = false,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color:
          selected ? Get.theme.primaryColor.withOpacity(0.25) : AppColor.light,
      child: InkWell(
        onTap: () => onSelect(data),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            data.title ?? "",
            style: TextStyle(
              color: selected ? Get.theme.primaryColor : AppColor.gray,
              fontSize: 12,
              fontFamily: selected ? AppFont.semiBold : AppFont.medium,
            ),
          ),
        ),
      ),
    );
  }
}

class IuranFilterSheetChipPaid extends StatelessWidget {
  final IuranFilter data;
  final bool selected;
  final ValueChanged<IuranFilter> onSelect;

  const IuranFilterSheetChipPaid({
    Key? key,
    required this.data,
    this.selected = false,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> backgroundColor = {
      "paid": AppColor.green,
      "due": AppColor.red,
    };

    return Material(
      borderRadius: BorderRadius.circular(8),
      color: selected
          ? backgroundColor[data.slug]?.withOpacity(0.25)
          : AppColor.light,
      child: InkWell(
        onTap: () => onSelect(data),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            data.title ?? "",
            style: TextStyle(
              color: selected
                  ? backgroundColor[data.slug]
                  : AppColor.gray,
              fontSize: 12,
              fontFamily: selected ? AppFont.semiBold : AppFont.medium,
            ),
          ),
        ),
      ),
    );
  }
}
