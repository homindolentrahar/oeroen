import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';
import 'package:oeroen/features/desa/presentation/widgets/desa_list_item.dart';
import 'package:oeroen/presentation/widgets/app_text_button.dart';

class AdminSelectDesaSheet extends StatelessWidget {
  const AdminSelectDesaSheet({
    super.key,
    required this.allDesa,
    required this.selectedDesaId,
    required this.onTambahDesa,
    required this.onDesaSelected,
  });

  final List<Desa> allDesa;
  final String selectedDesaId;
  final VoidCallback onTambahDesa;
  final ValueChanged<Desa> onDesaSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Desamu",
            style: TextStyle(
              color: AppColor.black,
              fontSize: 16,
              fontFamily: AppFont.semiBold,
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: allDesa.length + 1,
              itemBuilder: (ctx, index) {
                if (index == allDesa.length) {
                  return AppTextButton(
                    text: "Tambah Desa",
                    icon: SvgPicture.asset(
                      "assets/icons/add.svg",
                      color: Get.theme.primaryColor.withOpacity(0.75),
                    ),
                    textColor: Get.theme.primaryColor.withOpacity(0.75),
                    onPressed: onTambahDesa,
                  );
                } else {
                  return AdminDesaListItem(
                    isSelected: allDesa[index].id == selectedDesaId,
                    data: allDesa[index],
                    onPressed: onDesaSelected,
                  );
                }
              },
              separatorBuilder: (ctx, index) => const SizedBox(height: 16),
            ),
          ),
        ],
      ),
    );
  }
}
