import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/core/presentation/widgets/core_app_bar.dart';
import 'package:oeroen/core/presentation/widgets/iuran_list_item.dart';
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
                  IuranMenuFilter(controller: controller),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (ctx, index) {
                        return IuranListItem(
                          onPressed: () {
                            Get.toNamed(
                              "${AppRoute.mainIuranRoute}/5",
                              arguments: {'title': "Iuran Keamanan"},
                            );
                          },
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return const SizedBox(height: 16);
                      },
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
