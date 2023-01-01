import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:oeroen/core/presentation/application/base_controller.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';
import 'package:oeroen/features/desa/domain/usecases/listen_all_data.dart';
import 'package:oeroen/features/transaction/domain/models/warga_transaction.dart';
import 'package:oeroen/features/transaction/domain/usecases/listen_transactions_in_desa.dart';
import 'package:oeroen/utils/helper/secure_storage_helper.dart';

class AdminMainController extends GetxController {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  final ListenAllDesa getAllDesa;
  final ListenTransactionsInDesa listenTransactionsInDesa;

  AdminMainController({
    required this.getAllDesa,
    required this.listenTransactionsInDesa,
  });

  ControllerStatus status = ControllerStatus.initial;
  List<Desa>? allDesa;
  List<WargaTransaction>? transactionsInDesa;
  String selectedDesaId = "";

  @override
  void onInit() {
    getIncomingData();
    super.onInit();
  }

  Future<void> getIncomingData() async {
    final desaCredential =
        await SecureStorageHelper.instance.getDesaCredential();

    selectedDesaId = desaCredential['id'];
    getAllDesa().listen(
      (either) {
        status = ControllerStatus.loading;
        update();

        either.fold(
          (error) {
            allDesa = [];
            status = ControllerStatus.error;
            update();
          },
          (list) {
            allDesa = list;
            status = ControllerStatus.success;
            update();
          },
        );
      },
    );

    listenTransactionsInDesa().listen(
      (either) {
        status = ControllerStatus.loading;
        update();

        either.fold(
          (error) {
            transactionsInDesa = [];
            status = ControllerStatus.error;
            update();
          },
          (list) {
            transactionsInDesa = list;
            status = ControllerStatus.success;
            update();
          },
        );
      },
    );
  }

  Future<void> selectDesa(Desa desa) async {
    selectedDesaId = desa.id ?? "";
    final jsonData = {
      'id': desa.id,
      'unique_code': desa.uniqueCode,
    };
    await SecureStorageHelper.instance.saveDesaCredential(jsonData);
    getIncomingData();
    update();
  }
}
