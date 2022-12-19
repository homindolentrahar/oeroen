import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/core/presentation/widgets/core_app_bar.dart';
import 'package:oeroen/core/presentation/widgets/iuran_filter_sheet.dart';
import 'package:oeroen/core/presentation/widgets/iuran_list_item.dart';
import 'package:oeroen/features/iuran/domain/models/iuran.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_filter.dart';
import 'package:oeroen/features/iuran/presentation/application/iuran_controller.dart';
import 'package:oeroen/features/iuran/presentation/widgets/iuran_menu_filter.dart';
import 'package:oeroen/routes/app_route.dart';

class IuranScreen extends StatelessWidget {
  const IuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: GetBuilder<IuranController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  const CoreAppBar(
                    backEnabled: true,
                    title: "Iuran",
                  ),
                  const SizedBox(height: 32),
                  IuranMenuFilter(
                    activeIndex: controller.iuranMenuIndex,
                    initialFilters: controller.filters,
                    onMenuChanged: (value) {
                      controller.iuranMenuChanged(value);
                    },
                    onRemoveFilter: (value) {
                      controller.removeFilter(value);
                    },
                    onTapShowSheet: () async {
                      final List<IuranFilter>? filter = await Get.bottomSheet(
                        IuranFilterSheet(
                          filters: controller.filters,
                          showPaid: false,
                        ),
                      );

                      if (filter != null) {
                        controller.setFilters(filter);
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  IuranBody(
                    datas: controller.iuranMenuIndex == 0
                        ? controller.activeIuran
                        : controller.transactionIuran,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class IuranBody extends StatelessWidget {
  const IuranBody({super.key, required this.datas});

  final List<Iuran> datas;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: datas.length,
        itemBuilder: (ctx, index) => IuranListItem(
          data: datas[index],
          onPressed: (data) {
            Get.toNamed("${AppRoute.mainIuranRoute}/${data.id}");
          },
        ),
        separatorBuilder: (ctx, index) => const SizedBox(height: 16),
      ),
    );
  }
}
