import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/presentation/widgets/iuran_filter_sheet_category.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_filter.dart';
import 'package:oeroen/features/transaction/domain/models/warga_transaction.dart';
import 'package:oeroen/features/transaction/domain/repositories/i_warga_transaction_repository.dart';
import 'package:oeroen/features/transaction/domain/usecases/create_transaction.dart';
import 'package:oeroen/features/transaction/domain/usecases/delete_transaction.dart';
import 'package:oeroen/features/transaction/domain/usecases/update_transaction.dart';
import 'package:oeroen/features/transaction/presentation/application/crud_transaction_controller.dart';
import 'package:oeroen/presentation/widgets/app_fill_button.dart';
import 'package:oeroen/presentation/widgets/app_text_button.dart';
import 'package:oeroen/presentation/widgets/app_text_field.dart';

class CrudTransactionFormSheet extends StatelessWidget {
  const CrudTransactionFormSheet({
    super.key,
    this.initialData,
  });

  final WargaTransaction? initialData;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CrudTransactionController>(
        init: CrudTransactionController(
          createTransactionUseCase:
              CreateTransaction(Get.find<IWargaTransactionRepository>()),
          updateTransactionUseCase:
              UpdateTransaction(Get.find<IWargaTransactionRepository>()),
          deleteTransactionUseCase:
              DeleteTransaction(Get.find<IWargaTransactionRepository>()),
        )..populateInitialData(initialData),
        builder: (controller) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.initialData == null
                          ? "Buat Iuran"
                          : "Perbarui Iuran",
                      style: const TextStyle(
                        color: AppColor.black,
                        fontSize: 16,
                        fontFamily: AppFont.semiBold,
                      ),
                    ),
                    Visibility(
                      visible: controller.initialData != null,
                      child: GestureDetector(
                        onTap: () {
                          Get.defaultDialog(
                            title: "Hapus Iuran",
                            titleStyle: Get.textTheme.headline5,
                            titlePadding: const EdgeInsets.all(16),
                            radius: 8,
                            content: Text(
                              "Data iuran tidak dapat dikembalikan jika anda menghapusnya",
                              textAlign: TextAlign.center,
                              style: Get.textTheme.bodyText1?.copyWith(),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            actions: [
                              AppTextButton(
                                text: "Batal",
                                textColor: AppColor.gray,
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                              const SizedBox(width: 16),
                              AppTextButton(
                                text: "Hapus",
                                textColor: AppColor.red,
                                onPressed: () {
                                  controller.deleteTransaction(
                                      controller.initialData?.id ?? "");
                                  Get.back();
                                  Get.back();
                                },
                              ),
                            ],
                          );
                        },
                        child: SvgPicture.asset(
                          "assets/icons/ic_delete_fill.svg",
                          width: 20,
                          height: 20,
                          color: AppColor.red,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                FormBuilder(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  autoFocusOnValidationFailure: true,
                  child: Column(
                    children: [
                      IuranFilterSheetCategory(
                        initialValue: controller.category,
                        onSelect: (IuranFilter? value) {
                          controller.categoryChanged(value);
                        },
                      ),
                      const SizedBox(height: 8),
                      AppTextField(
                        intialValue:
                            controller.initialData?.amount?.toStringAsFixed(0),
                        name: 'amount',
                        hintText: "Nominal Iuran",
                        fillColor: AppColor.light,
                        prefix: SvgPicture.asset(
                          "assets/icons/ic_money.svg",
                          width: 20,
                          height: 20,
                          color: AppColor.gray,
                        ),
                        keyboardType: TextInputType.number,
                        action: TextInputAction.done,
                        validators: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                      ),
                      const SizedBox(height: 16),
                      Visibility(
                        child: GestureDetector(
                          child: Row(
                            children: [
                              Text(
                                controller.initialData?.paidUsers?.isEmpty ??
                                        true
                                    ? "Belum ada warga yang membayar iuran"
                                    : "${controller.initialData?.paidUsers?.length} warga telah membayar iuran",
                                style: Get.textTheme.bodyText2,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      AppFillButton(
                        text: controller.initialData == null
                            ? "Buat"
                            : "Perbarui",
                        onPressed: () {
                          if (controller.saveAndValidate()) {
                            controller.initialData == null
                                ? controller.createTransaction()
                                : controller.updateTransaction(
                                    controller.initialData?.id ?? "");
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
