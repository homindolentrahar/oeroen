import 'package:flutter/material.dart';
import 'package:oeroen/core/domain/models/iuran_filter.dart';
import 'package:oeroen/core/presentation/widgets/category_chip_item.dart';
import 'package:oeroen/core/presentation/widgets/paid_type_chip_item.dart';
import 'package:oeroen/core/presentation/widgets/sort_chip_item.dart';

class IuranFilterChips extends StatelessWidget {
  final IuranFilter? filter;

  const IuranFilterChips({Key? key, this.filter}) : super(key: key);

  int get getListCount {
    int count = 0;
    if (filter?.category != null) {
      count += 1;
    }
    if (filter?.sort != null) {
      count += 1;
    }
    if (filter?.paidType != null) {
      count += 1;
    }

    return count;
  }

  List<Widget> get getListItem {
    List<Widget> items = [];
    if (filter?.category != null) {
      items.add(
        CategoryChipItem(category: filter?.category),
      );
    }
    if (filter?.sort != null) {
      items.add(
        SortChipItem(sort: filter?.sort),
      );
    }
    if (filter?.paidType != null) {
      items.add(
        PaidTypeChipItem(type: filter?.paidType),
      );
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: getListCount,
        itemBuilder: (ctx, index) {
          return getListItem[index];
        },
        separatorBuilder: (ctx, index) {
          return const SizedBox(width: 8);
        },
      ),
    );
  }
}
