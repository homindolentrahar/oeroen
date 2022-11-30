import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/core/domain/models/iuran_filter.dart';
import 'package:oeroen/core/presentation/widgets/category_chip_item.dart';
import 'package:oeroen/core/presentation/widgets/paid_type_chip_item.dart';
import 'package:oeroen/core/presentation/widgets/sort_chip_item.dart';

class IuranFilterChips extends StatelessWidget {
  const IuranFilterChips({
    Key? key,
    required this.filters,
    required this.onRemove,
    this.emptyTitle = "Semua Item",
  }) : super(key: key);

  final List<IuranFilter> filters;
  final ValueChanged<IuranFilter> onRemove;
  final String emptyTitle;

  Widget getItem(IuranFilter filter, VoidCallback onRemove) {
    if (filter.type == IuranFilterType.category) {
      return CategoryChipItem(
        data: filter,
        onRemove: onRemove,
      );
    }
    if (filter.type == IuranFilterType.sort) {
      return SortChipItem(
        data: filter,
        onRemove: onRemove,
      );
    }
    if (filter.type == IuranFilterType.paidType) {
      return PaidTypeChipItem(
        data: filter,
        onRemove: onRemove,
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return filters.isEmpty
        ? Text(
            emptyTitle,
            style: Get.textTheme.headline6?.copyWith(
              color: AppColor.black,
            ),
          )
        : SizedBox(
            height: 36,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (ctx, index) {
                return getItem(
                  filters[index],
                  () => onRemove(filters[index]),
                );
              },
              separatorBuilder: (ctx, index) => const SizedBox(width: 8),
            ),
          );
  }
}
