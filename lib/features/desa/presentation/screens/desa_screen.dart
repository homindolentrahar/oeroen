import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oeroen/core/presentation/widgets/main_app_bar.dart';
import 'package:oeroen/core/presentation/widgets/section_subtitle.dart';
import 'package:oeroen/features/desa/presentation/widgets/info_desa_banner.dart';
import 'package:oeroen/features/desa/presentation/widgets/iuran_desa_grid_item.dart';
import 'package:oeroen/features/desa/presentation/widgets/transaksi_desa_list_item.dart';
import 'package:oeroen/routes/app_route.dart';

class DesaScreen extends StatelessWidget {
  const DesaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(32),
      physics: const BouncingScrollPhysics(),
      children: [
        const MainAppBar(title: "Desa"),
        const SizedBox(height: 32),
        const InfoDesaBanner(),
        const SizedBox(height: 32),
        SectionSubtitle(
          subtitle: "Iuran di Desa Talangsari",
          onPressed: () {
            Get.toNamed(
              AppRoute.iuranListRoute,
              arguments: {
                "title": "Iuran Desa Talangsari",
              },
            );
          },
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 144,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (ctx, index) {
              return IuranDesaGridItem(
                onPressed: () {},
              );
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(width: 16);
            },
          ),
        ),
        const SizedBox(height: 32),
        SectionSubtitle(
          subtitle: "Transaksi Desa",
          onPressed: () {
            Get.toNamed(
              AppRoute.iuranListRoute,
              arguments: {
                "title": "Transaksi Desa",
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
              TransaksiDesaListItem(
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
