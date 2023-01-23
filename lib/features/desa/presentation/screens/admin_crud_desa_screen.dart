import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/theme/app_color.dart';
import 'package:oeroen/common/theme/app_font.dart';
import 'package:oeroen/core/presentation/widgets/core_app_bar.dart';
import 'package:oeroen/features/desa/presentation/application/admin_crud_desa_controller.dart';
import 'package:oeroen/presentation/widgets/app_fill_button.dart';
import 'package:oeroen/presentation/widgets/app_text_button.dart';
import 'package:oeroen/presentation/widgets/app_text_field.dart';

class AdminCrudDesaScreen extends StatelessWidget {
  const AdminCrudDesaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminCrudDesaController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColor.light,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                CoreAppBar(
                  title: controller.initialData == null
                      ? 'Tambah Desa'
                      : 'Perbarui Desa',
                  backEnabled: true,
                  action: controller.initialData == null
                      ? null
                      : GestureDetector(
                          onTap: () {
                            Get.defaultDialog(
                              title: "Hapus Desa",
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
                                    // controller.deleteDesa(
                                    // controller.initialData?.id ?? "");
                                    Get.back();
                                    Get.back();
                                    Get.back();
                                    Get.back();
                                  },
                                ),
                              ],
                            );
                          },
                          child: SvgPicture.asset(
                            "assets/icons/ic_delete_fill.svg",
                            color: AppColor.red,
                            width: 24,
                            height: 24,
                          ),
                        ),
                ),
                const SizedBox(height: 32),
                FormBuilder(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Kode Unik Desa",
                        style: Get.textTheme.bodyText1?.copyWith(
                          color: AppColor.dark,
                          fontSize: 12,
                          fontFamily: AppFont.medium,
                        ),
                      ),
                      const SizedBox(height: 16),
                      PinTextField(
                        controller: TextEditingController(
                            text: controller.initialData?.uniqueCode ?? ""),
                        name: 'unique_code',
                        onChanged: (value) {},
                      ),
                      AppTextField(
                        intialValue: controller.initialData?.name,
                        name: 'name',
                        hintText: "Nama Desa",
                        action: TextInputAction.next,
                        validators: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: AppTextField(
                              intialValue: controller.initialData?.district,
                              name: 'district',
                              hintText: "Kecamatan",
                              action: TextInputAction.next,
                              validators: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: AppTextField(
                              intialValue: controller.initialData?.city,
                              name: 'city',
                              hintText: "Kota",
                              action: TextInputAction.next,
                              validators: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        intialValue: controller.initialData?.province,
                        name: 'province',
                        hintText: "Provinsi",
                        action: TextInputAction.next,
                        validators: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Statistik Desa",
                        style: Get.textTheme.bodyText1?.copyWith(
                          color: AppColor.dark,
                          fontSize: 12,
                          fontFamily: AppFont.medium,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: AppTextField(
                              intialValue: controller.initialData?.population
                                  ?.toStringAsFixed(0),
                              name: 'population',
                              hintText: "Populasi",
                              action: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              validators: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.numeric(),
                              ]),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: AppTextField(
                              intialValue:
                                  controller.initialData?.area?.toString(),
                              name: 'area',
                              hintText: "Luas Area",
                              action: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              validators: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.numeric(),
                              ]),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        intialValue: controller.initialData?.zipCode,
                        name: 'zip_code',
                        hintText: "Kode Pos",
                        action: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        validators: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: AppTextField(
                              intialValue: controller.initialData?.langitude,
                              name: 'langitude',
                              hintText: "Langitude",
                              action: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              validators: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.numeric(),
                              ]),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: AppTextField(
                              intialValue: controller.initialData?.longitude,
                              name: 'longitude',
                              hintText: "Longitude",
                              action: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              validators: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                                FormBuilderValidators.numeric(),
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                AppFillButton(
                  text: controller.initialData == null ? "Tambah" : "Perbarui",
                  onPressed: () {
                    if (controller.saveAndValidate()) {
                      controller.initialData == null
                          ? controller.addDesa()
                          : controller.updateDesa(
                              controller.initialData?.id ?? "",
                            );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
