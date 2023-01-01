import 'package:get/get.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';
import 'package:oeroen/features/desa/domain/usecases/get_desa_by_code.dart';
import 'package:oeroen/features/iuran/domain/models/iuran.dart';
import 'package:oeroen/features/iuran/domain/usecases/get_iuran.dart';
import 'package:oeroen/features/transaction/domain/models/warga_transaction.dart';
import 'package:oeroen/features/transaction/domain/usecases/get_transaction.dart';
import 'package:oeroen/utils/dialog_util.dart';

class IuranDetailController extends GetxController {
  IuranDetailController({
    required this.getIuran,
    required this.getDesaByCode,
    required this.getTransaction,
  });

  final GetIuran getIuran;
  final GetDesaByCode getDesaByCode;
  final GetTransaction getTransaction;

  WargaTransaction? transaction;
  Iuran? iuran;
  Desa? desa;

  @override
  void onReady() {
    final id = Get.parameters['id'] ?? "";
    final desaCode = Get.parameters['desa_code'] ?? "";

    DialogUtil.showLoading();
    Future.wait([
      getData(id),
      getDesaData(desaCode),
    ]).then((value) {
      DialogUtil.hideLoading();

      update();
    });

    super.onReady();
  }

  Future<void> getData(String id) async {
    // final result = await getIuran(id);

    // result.fold(
    //   (error) {
    //     iuran = null;
    //   },
    //   (data) {
    //     iuran = data;
    //   },
    // );
    final result = await getTransaction(id);

    result.fold(
      (error) {
        transaction = null;
      },
      (data) {
        transaction = data;
      },
    );
  }

  Future<void> getDesaData(String desaCode) async {
    final result = await getDesaByCode(desaCode);

    result.fold(
      (error) {
        desa = null;
      },
      (data) {
        desa = data;
      },
    );
  }
}
