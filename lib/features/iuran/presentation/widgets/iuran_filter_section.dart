import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/core/presentation/widgets/iuran_filter_chips.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_filter.dart';

class IuranFilterSection extends StatelessWidget {
  const IuranFilterSection(
      {Key? key,
      required this.initialFilters,
      required this.onRemoveFilter,
      required this.onTapShowSheet})
      : super(key: key);

  final List<IuranFilter> initialFilters;
  final ValueChanged<IuranFilter> onRemoveFilter;
  final VoidCallback onTapShowSheet;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: IuranFilterChips(
            filters: initialFilters,
            onRemove: onRemoveFilter,
          ),
        ),
        const SizedBox(width: 16),
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
    );
  }
}
