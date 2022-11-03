import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/domain/models/iuran_filter.dart';
import 'package:oeroen/core/presentation/application/iuran_filter_controller.dart';

class IuranFilterPaid extends StatelessWidget {
  final PaidType? type;

  const IuranFilterPaid({Key? key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<IuranFilterController>();

    return FormBuilderField(
      name: 'filter_paid',
      initialValue: type,
      builder: (field) {
        return Wrap(
          spacing: 8,
          runSpacing: 8,
          children: PaidType.values
              .map(
                (item) => IuranFilterPaidChip(
                  type: item,
                  selected: item == type,
                  onSelect: (type) {
                    controller.selectPaidType(type);
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

class IuranFilterPaidChip extends StatelessWidget {
  final PaidType? type;
  final bool selected;
  final ValueChanged<PaidType?> onSelect;

  const IuranFilterPaidChip({
    Key? key,
    this.type,
    this.selected = false,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: selected
          ? type == PaidType.paid
              ? AppColor.green.withOpacity(0.25)
              : type == PaidType.due
                  ? AppColor.red.withOpacity(0.25)
                  : AppColor.light
          : AppColor.light,
      child: InkWell(
        onTap: () => onSelect(type),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            Constants.paidTypeTitle[type] ?? "",
            style: TextStyle(
              color: selected
                  ? type == PaidType.paid
                      ? AppColor.green
                      : type == PaidType.due
                          ? AppColor.red
                          : AppColor.gray
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
