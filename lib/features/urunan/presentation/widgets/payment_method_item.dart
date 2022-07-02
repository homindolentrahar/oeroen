import 'package:flutter/material.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/urunan/domain/model/payment_method.dart';

class PaymentMethodItem extends StatelessWidget {
  final PaymentMethod item;

  const PaymentMethodItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            item.image,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                color: AppColor.white,
                fontSize: 16,
                fontFamily: AppFont.semiBold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "0857-1122-3344",
              style: TextStyle(
                color: AppColor.gray,
                fontSize: 12,
                fontFamily: AppFont.medium,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
