import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_filter.dart';
import 'package:oeroen/features/transaction/domain/models/warga_transaction.dart';
import 'package:oeroen/features/transaction/domain/usecases/create_transaction.dart';
import 'package:oeroen/features/transaction/domain/usecases/delete_transaction.dart';
import 'package:oeroen/features/transaction/domain/usecases/update_transaction.dart';
import 'package:oeroen/utils/dialog_util.dart';
import 'package:oeroen/utils/helper/secure_storage_helper.dart';
import 'package:oeroen/utils/snackbar_util.dart';
import 'package:uuid/uuid.dart';

class CrudTransactionController extends GetxController {
  CrudTransactionController({
    required this.createTransactionUseCase,
    required this.deleteTransactionUseCase,
    required this.updateTransactionUseCase,
  });

  final CreateTransaction createTransactionUseCase;
  final DeleteTransaction deleteTransactionUseCase;
  final UpdateTransaction updateTransactionUseCase;
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  IuranFilter? category;
  WargaTransaction? initialData;

  void populateInitialData(WargaTransaction? data) {
    initialData = data;
    categoryChanged(
      Constants.iuranFilters.firstWhere(
        (item) =>
            item.type == IuranFilterType.category &&
            item.slug == data?.categorySlug,
        orElse: () => IuranFilter(),
      ),
    );
  }

  void categoryChanged(IuranFilter? value) {
    category = value;
    update();
  }

  bool saveAndValidate() {
    return formKey.currentState!.saveAndValidate() && category?.slug != null;
  }

  Future<void> createTransaction() async {
    DialogUtil.showLoading();

    final desaCredential =
        await SecureStorageHelper.instance.getDesaCredential();
    final result = await createTransactionUseCase(
      WargaTransaction(
        id: const Uuid().v4(),
        desaId: desaCredential['id'],
        desaCode: desaCredential['unique_code'],
        amount: double.parse(formKey.currentState!.value['amount']),
        categorySlug: category?.slug,
        createdAt: DateTime.now(),
        paidUsers: [],
      ),
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

  Future<void> deleteTransaction(String id) async {
    DialogUtil.showLoading();

    final result = await deleteTransactionUseCase(id);

    DialogUtil.hideLoading();

    result.fold(
      (error) {
        Get.back();
        SnackBarUtil.showError(message: "Tidak dapat menghapus iuran");
      },
      (_) {
        Get.back();
        SnackBarUtil.showSuccess(
          title: "Iuran berhasil dihapus",
          message: "Iuranmu telah dihapus dari kewajiban wargamu",
        );
      },
    );
  }

  Future<void> updateTransaction(String id) async {
    DialogUtil.showLoading();

    final result = await updateTransactionUseCase(
      id: id,
      data: {
        'category_slug': category?.slug,
        'amount': double.parse(formKey.currentState!.value['amount']),
      },
    );

    DialogUtil.hideLoading();

    result.fold(
      (error) {
        Get.back();
        SnackBarUtil.showError(message: "Tidak dapat memperbarui iuran");
      },
      (_) {
        Get.back();
        SnackBarUtil.showSuccess(
          title: "Iuran berhasil diperbarui",
          message: "Iuranmu akan ditagihkan ke semua warga desamu",
        );
      },
    );
  }
}
