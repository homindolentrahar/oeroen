import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/core/presentation/widgets/core_app_bar.dart';
import 'package:oeroen/core/presentation/widgets/iuran_filter_sheet.dart';
import 'package:oeroen/core/presentation/widgets/iuran_list_item.dart';
import 'package:oeroen/features/beranda/presentation/application/recent_transaction_controller.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_filter.dart';
import 'package:oeroen/features/iuran/presentation/widgets/iuran_filter_section.dart';
import 'package:oeroen/routes/app_route.dart';

class RecentTransactionScreen extends StatelessWidget {
  const RecentTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: GetBuilder<RecentTransactionController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                children: [
                  const CoreAppBar(
                    backEnabled: true,
                    title: "Pembayaran Terkini",
                  ),
                  const SizedBox(height: 32),
                  IuranFilterSection(
                    initialFilters: controller.filters,
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
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.paidIuran.length,
                      itemBuilder: (ctx, index) => IuranListItem(
                        isTransaction: true,
                        data: controller.paidIuran[index],
                        onPressed: (data) {
                          Get.toNamed(
                            "${AppRoute.iuranRoute}/${controller.paidIuran[index].id}",
                            arguments: {'title': "Iuran Keamanan"},
                          );
                        },
                      ),
                      separatorBuilder: (ctx, index) =>
                          const SizedBox(height: 16),
                    ),
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
