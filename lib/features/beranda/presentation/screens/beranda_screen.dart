import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oeroen/core/presentation/widgets/main_app_bar.dart';
import 'package:oeroen/core/presentation/widgets/section_subtitle.dart';
import 'package:oeroen/features/beranda/presentation/widgets/beranda_banner.dart';
import 'package:oeroen/features/beranda/presentation/widgets/beranda_category.dart';
import 'package:oeroen/core/presentation/widgets/iuran_list_item.dart';
import 'package:oeroen/routes/app_route.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(32),
      physics: const BouncingScrollPhysics(),
      children: [
        const MainAppBar(title: "Beranda"),
        const SizedBox(height: 32),
        const BerandaBanner(),
        const SizedBox(height: 32),
        const BerandaCategoryTiles(),
        const SizedBox(height: 32),
        SectionSubtitle(
          subtitle: "Pembayaran Terkini",
          onPressed: () {
            Get.toNamed(
              AppRoute.iuranListRoute,
              arguments: {
                "title": "Pembayaran Terkini",
              },
            );
          },
        ),
        const SizedBox(height: 16),
        ...List.generate(
          10,
          (index) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IuranListItem(
                onPressed: () {},
              ),
              index == 9 ? const SizedBox.shrink() : const SizedBox(height: 16)
            ],
          ),
        ),
      ],
    );
  }
}
