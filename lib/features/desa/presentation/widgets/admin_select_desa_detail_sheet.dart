import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';
import 'package:oeroen/presentation/widgets/app_fill_button.dart';

class AdminSelectDesaDetailSheet extends StatelessWidget {
  const AdminSelectDesaDetailSheet({
    super.key,
    required this.desa,
    required this.onTapEdit,
    required this.onPilihDesa,
  });

  final Desa desa;
  final VoidCallback onTapEdit;
  final VoidCallback? onPilihDesa;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  "assets/icons/ic_desa.svg",
                  color: AppColor.dark,
                  width: 20,
                  height: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      desa.name ?? "",
                      style: Get.textTheme.headline5?.copyWith(
                        color: AppColor.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      desa.uniqueCode ?? "",
                      style: Get.textTheme.bodyText2?.copyWith(
                        color: AppColor.dark,
                        fontFamily: AppFont.medium,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: onTapEdit,
                child: SvgPicture.asset(
                  "assets/icons/ic_edit.svg",
                  width: 20,
                  height: 20,
                  color: AppColor.gray,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          AppFillButton(
            text: "Pilih Desa",
            onPressed: onPilihDesa,
          ),
        ],
      ),
    );
  }
}
