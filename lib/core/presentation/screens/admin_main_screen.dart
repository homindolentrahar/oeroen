import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/presentation/application/admin_main_controller.dart';
import 'package:oeroen/core/presentation/widgets/popup_menu_item_child.dart';
import 'package:oeroen/core/presentation/widgets/state_handle_widget.dart';
import 'package:oeroen/core/presentation/widgets/user_avatar.dart';
import 'package:oeroen/features/auth/presentation/application/auth_controller.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';
import 'package:oeroen/features/desa/presentation/widgets/desa_list_item.dart';
import 'package:oeroen/features/transaction/domain/models/warga_transaction.dart';
import 'package:oeroen/features/transaction/presentation/widget/crud_transaction_form_sheet.dart';
import 'package:oeroen/features/transaction/presentation/widget/transaction_in_desa_list_item.dart';
import 'package:oeroen/presentation/widgets/app_text_button.dart';
import 'package:oeroen/routes/app_route.dart';
import 'package:shimmer/shimmer.dart';

class AdminMainScreen extends StatelessWidget {
  const AdminMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminMainController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: RawMaterialButton(
          elevation: 2,
          highlightElevation: 2,
          padding: const EdgeInsets.all(16),
          fillColor: Get.theme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.add,
                color: AppColor.white,
              ),
              const SizedBox(width: 8),
              Text(
                "Buat Iuran",
                style: Get.textTheme.bodyText1?.copyWith(
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          onPressed: () {
            Get.bottomSheet(
              const CrudTransactionFormSheet(),
              enableDrag: false,
              backgroundColor: AppColor.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            );
          },
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                StateHandleWidget(
                  status: controller.status,
                  loadingView: Shimmer.fromColors(
                    baseColor: AppColor.gray.withOpacity(0.15),
                    highlightColor: AppColor.white.withOpacity(0.35),
                    child: Container(
                      height: 32,
                      width: 120,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(
                            Padding(
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
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount:
                                          (controller.allDesa?.length ?? 0) + 1,
                                      itemBuilder: (ctx, index) {
                                        if (index ==
                                            (controller.allDesa?.length ?? 1)) {
                                          return AppTextButton(
                                            text: "Tambah Desa",
                                            icon: SvgPicture.asset(
                                              "assets/icons/add.svg",
                                              color: Get.theme.primaryColor
                                                  .withOpacity(0.75),
                                            ),
                                            textColor: Get.theme.primaryColor
                                                .withOpacity(0.75),
                                            onPressed: () {
                                              Get.back();
                                              Get.toNamed(
                                                  AppRoute.desaAddRoute);
                                            },
                                          );
                                        } else {
                                          return DesaListItem(
                                            isSelected:
                                                controller.allDesa?[index].id ==
                                                    controller.selectedDesaId,
                                            data: controller.allDesa?[index] ??
                                                Desa(),
                                            onPressed: (desa) {
                                              if (desa.id !=
                                                  controller.selectedDesaId) {
                                                controller.selectDesa(desa);
                                              }
                                            },
                                          );
                                        }
                                      },
                                      separatorBuilder: (ctx, index) =>
                                          const SizedBox(height: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            enableDrag: false,
                            backgroundColor: Get.theme.canvasColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              controller.allDesa?[0].name ?? "-",
                              style: Get.textTheme.headline4
                                  ?.copyWith(color: AppColor.black),
                            ),
                            const SizedBox(width: 8),
                            SvgPicture.asset(
                              "assets/icons/ic_chevron_down.svg",
                              width: 20,
                              height: 20,
                              color: AppColor.black,
                            )
                          ],
                        ),
                      ),
                      UserAvatar(
                        items: [
                          PopupMenuItem(
                            value: 'logout',
                            onTap: () {
                              Get.find<AuthController>().signOut();
                            },
                            child: const PopupMenuItemChild(
                              icon: "assets/icons/ic_sign_out.svg",
                              title: "Keluar",
                              textColor: AppColor.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) => TransactionInDesaListItem(
                    data: controller.transactionsInDesa?[index] ??
                        WargaTransaction(),
                    onPressed: (data) {
                      Get.bottomSheet(
                        CrudTransactionFormSheet(initialData: data),
                        enableDrag: false,
                        backgroundColor: AppColor.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                      );
                    },
                  ),
                  separatorBuilder: (ctx, index) => const SizedBox(height: 16),
                  itemCount: controller.transactionsInDesa?.length ?? 0,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
