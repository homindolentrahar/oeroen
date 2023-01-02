import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';
import 'package:oeroen/features/desa/domain/usecases/add_desa.dart';
import 'package:oeroen/features/desa/domain/usecases/delete_desa.dart';
import 'package:oeroen/features/desa/domain/usecases/update_desa.dart';
import 'package:oeroen/utils/dialog_util.dart';
import 'package:oeroen/utils/helper/secure_storage_helper.dart';
import 'package:oeroen/utils/snackbar_util.dart';
import 'package:uuid/uuid.dart';

class AdminCrudDesaController extends GetxController {
  final AddDesa addDesaUseCase;
  final UpdateDesa updateDesaUseCase;
  final DeleteDesa deleteDesaUseCase;

  AdminCrudDesaController({
    required this.addDesaUseCase,
    required this.updateDesaUseCase,
    required this.deleteDesaUseCase,
  });

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final Desa? initialData = Get.arguments;

  bool saveAndValidate() {
    return formKey.currentState!.saveAndValidate();
  }

  Future<void> addDesa() async {
    DialogUtil.showLoading();

    final userCredential =
        await SecureStorageHelper.instance.getUserCredential();
    final formData = formKey.currentState!.value;
    final desa = Desa(
      id: const Uuid().v4(),
      adminId: userCredential,
      uniqueCode: formData['unique_code'],
      name: formData['name'],
      district: formData['district'],
      city: formData['city'],
      province: formData['province'],
      population: int.parse(formData['population']),
      area: double.parse(formData['area']),
      zipCode: formData['zip_code'],
      langitude: formData['langitude'],
      longitude: formData['longitude'],
      activities: [],
      stakeholders: [],
      iurans: [],
    );

    final result = await addDesaUseCase(desa);

    DialogUtil.hideLoading();

    result.fold(
      (error) {
        Get.back();
        SnackBarUtil.showError(message: "Tidak dapat membuat iuran");
      },
      (_) async {
        Get.back(
          result: {
            'id': desa.id,
            'unique_code': desa.uniqueCode,
          },
        );
        SnackBarUtil.showSuccess(
          title: "Iuran berhasil dibuat",
          message: "Iuranmu akan ditagihkan ke semua warga desamu",
        );
      },
    );
  }

  Future<void> updateDesa(String id) async {
    DialogUtil.showLoading();

    final formData = formKey.currentState!.value;

    final result = await updateDesaUseCase(
      id: id,
      data: {
        'name': formData['name'],
        'district': formData['district'],
        'city': formData['city'],
        'province': formData['province'],
        'population': formData['population'],
        'area': formData['area'],
        'zip_code': formData['zip_code'],
        'langitude': formData['langitude'],
        'longitude': formData['longitude'],
      },
    );

    DialogUtil.hideLoading();

    result.fold(
      (error) {
        Get.back();
        SnackBarUtil.showError(message: "Tidak dapat membuat iuran");
      },
      (_) {
        Get.back();
        SnackBarUtil.showSuccess(
          title: "Iuran berhasil dibuat",
          message: "Iuranmu akan ditagihkan ke semua warga desamu",
        );
      },
    );
  }

  Future<void> deleteDesa(String id) async {
    DialogUtil.showLoading();

    final result = await deleteDesaUseCase(id);

    DialogUtil.hideLoading();

    result.fold(
      (error) {
        Get.back();
        SnackBarUtil.showError(message: "Tidak dapat membuat iuran");
      },
      (_) {
        Get.back();
        SnackBarUtil.showSuccess(
          title: "Iuran berhasil dibuat",
          message: "Iuranmu akan ditagihkan ke semua warga desamu",
        );
      },
    );
  }
}
