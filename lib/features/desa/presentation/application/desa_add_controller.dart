import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:oeroen/core/data/remote/warga_dto.dart';
import 'package:oeroen/core/domain/models/warga.dart';
import 'package:oeroen/features/desa/domain/usecases/get_desa_by_code.dart';
import 'package:oeroen/features/desa/presentation/application/desa_controller.dart';
import 'package:oeroen/features/warga/domain/usecases/get_warga.dart';
import 'package:oeroen/features/warga/domain/usecases/update_warga.dart';
import 'package:oeroen/utils/dialog_util.dart';
import 'package:oeroen/utils/helper/secure_storage_helper.dart';
import 'package:oeroen/utils/snackbar_util.dart';

class DesaAddController extends GetxController {
  final GetDesaByCode getDesaByCode;
  final GetWarga getWarga;
  final UpdateWarga updateWarga;

  DesaAddController({
    required this.getDesaByCode,
    required this.getWarga,
    required this.updateWarga,
  });

  final TextEditingController textEditingController = TextEditingController();
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  bool get isFormValid => formKey.currentState!.saveAndValidate();

  dynamic get inputDesaCode => formKey.currentState!.value['unique_code'];

  void reserFormState() => formKey.currentState!.reset();

  Future<void> checkDesaExists(String desaCode) async {
    DialogUtil.showLoading();

    final result = await getDesaByCode(desaCode);
    final eitherWarga = await getWarga();
    final warga = eitherWarga.getOrElse(() {
      return Warga();
    });

    DialogUtil.hideLoading();

    result.fold(
      (error) {
        SnackBarUtil.showError(message: "Desa tidak ditemukan");
      },
      (desa) async {
        if (warga.userId != null && (warga.userId?.isNotEmpty ?? false)) {
          if (warga.listDesa
                  ?.map((e) => e.uniqueCode)
                  .toList()
                  .contains(desa.uniqueCode) ??
              true) {
            SnackBarUtil.showInfo(
              title: "Anda telah terdaftar",
              message:
                  "Desa ${desa.name}, Kec. ${desa.district}, ${desa.city}, Provinsi ${desa.province}",
            );
          } else {
            SnackBarUtil.showSuccess(
              title: "Desa ditemukan",
              message:
                  "Desa ${desa.name}, Kec. ${desa.district}, ${desa.city}, Provinsi ${desa.province}",
            );

            final jsonData = {
              'id': desa.id,
              'unique_code': desa.uniqueCode,
            };
            await SecureStorageHelper.instance.saveDesaCredential(jsonData);

            // TODO: Update user's desa
            final updatedListDesa = [
              ...?warga.listDesa,
              WargaDesa(
                id: desa.id,
                uniqueCode: desa.uniqueCode,
                name: desa.name,
              ),
            ];
            final eitherUpdate = await updateWarga(
              wargaId: warga.userId ?? "",
              data: {
                'list_desa': updatedListDesa
                    .map((e) => WargaDesaDto.fromModel(e).toJson())
                    .toList()
              },
            );

            eitherUpdate.fold(
              (error) {},
              (_) {
                Get.back();
                Get.find<DesaController>()
                    .getIncomingData()
                    .then((value) => log("Refreshing Data..."));
              },
            );
          }
        }
      },
    );

    textEditingController.clear();
  }
}
