import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/core/presentation/widgets/core_app_bar.dart';
import 'package:oeroen/core/presentation/widgets/iuran_filter_sheet.dart';
import 'package:oeroen/core/presentation/widgets/iuran_list_item.dart';
import 'package:oeroen/features/desa/presentation/application/desa_transaction_controller.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_filter.dart';
import 'package:oeroen/features/iuran/presentation/widgets/iuran_filter_section.dart';
import 'package:oeroen/routes/app_route.dart';

class DesaTransactionScreen extends StatelessWidget {
  const DesaTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: GetBuilder<DesaTransactionController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                const CoreAppBar(
                  backEnabled: true,
                  title: "Transaksi di Desa",
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
                    itemCount: controller.transactionDesa.length,
                    itemBuilder: (ctx, index) => IuranListItem(
                      isTransaction: true,
                      data: controller.transactionDesa[index],
                      onPressed: (data) {
                        Get.toNamed(
                          "${AppRoute.mainIuranRoute}/${data.id}",
                          parameters: {'desa_code': data.desaCode ?? ""},
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
        }),
      ),
    );
  }
}
