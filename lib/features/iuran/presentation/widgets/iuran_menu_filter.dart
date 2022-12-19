import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/core/presentation/widgets/iuran_filter_chips.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_filter.dart';
import 'package:oeroen/features/iuran/presentation/widgets/iuran_menu.dart';

class IuranMenuFilter extends StatelessWidget {
  const IuranMenuFilter({
    Key? key,
    required this.activeIndex,
    required this.initialFilters,
    required this.onRemoveFilter,
    required this.onMenuChanged,
    required this.onTapShowSheet,
  }) : super(key: key);

  final int activeIndex;
  final List<IuranFilter> initialFilters;
  final ValueChanged<IuranFilter> onRemoveFilter;
  final ValueChanged<int> onMenuChanged;
  final VoidCallback onTapShowSheet;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: IuranMenu(
                activeIndex: activeIndex,
                onMenuChanged: onMenuChanged,
              ),
            ),
            Material(
              color: AppColor.light,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: onTapShowSheet,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: SvgPicture.asset(
                    "assets/icons/ic_sort.svg",
                    width: 16,
                    height: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        IuranFilterChips(
          emptyTitle: "Semua Iuran",
          filters: initialFilters,
          onRemove: onRemoveFilter,
        ),
      ],
    );
  }
}
