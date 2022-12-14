import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:oeroen/core/data/remote/warga_dto.dart';
import 'package:oeroen/core/domain/models/warga.dart';
import 'package:oeroen/features/desa/domain/usecases/get_desa_by_code.dart';
import 'package:oeroen/features/warga/domain/usecases/get_warga.dart';
import 'package:oeroen/features/warga/domain/usecases/update_warga.dart';
import 'package:oeroen/routes/app_route.dart';
import 'package:oeroen/utils/dialog_util.dart';
import 'package:oeroen/utils/helper/secure_storage_helper.dart';
import 'package:oeroen/utils/snackbar_util.dart';

class DesaRegisterController extends GetxController {
  final GetDesaByCode getDesaByCode;
  final GetWarga getWarga;
  final UpdateWarga updateWarga;

  DesaRegisterController({
    required this.getDesaByCode,
    required this.getWarga,
    required this.updateWarga,
  });

  final TextEditingController textEditingController = TextEditingController();
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  bool isFormValid() {
    return formKey.currentState!.saveAndValidate();
  }

  dynamic getFormFieldData(String field) {
    return formKey.currentState!.value[field];
  }

  void resetFormState() {
    formKey.currentState!.reset();
  }

  Future<void> checkDesaExists(String desaCode) async {
    DialogUtil.showLoading();

    final result = await getDesaByCode(desaCode);

    DialogUtil.hideLoading();

    result.fold(
      (error) {
        SnackBarUtil.showError(message: "Desa tidak ditemukan");
      },
      (desa) async {
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
        final eitherWarga = await getWarga();

        eitherWarga.fold(
          (error) {},
          (warga) async {
            final updatedListDesa = [
              ...?warga.listDesa,
              WargaDesa(
                desaId: desa.id,
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
                Get.offAllNamed(AppRoute.mainRoute);
              },
            );
          },
        );
      },
    );

    textEditingController.clear();
  }
}
