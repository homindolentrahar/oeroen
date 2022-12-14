import 'package:get/get.dart';
import 'package:oeroen/core/domain/models/warga.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';
import 'package:oeroen/features/desa/domain/usecases/listen_desa.dart';
import 'package:oeroen/features/desa/domain/usecases/listen_transaction_desa.dart';
import 'package:oeroen/features/iuran/domain/models/iuran.dart';
import 'package:oeroen/features/warga/domain/usecases/get_warga.dart';
import 'package:oeroen/utils/helper/secure_storage_helper.dart';

class DesaController extends GetxController {
  final ListenDesa listenDesa;
  final ListenTransactionDesa listenTransactionDesa;
  final GetWarga getWarga;

  DesaController({
    required this.listenDesa,
    required this.listenTransactionDesa,
    required this.getWarga,
  });

  Desa desa = Desa();
  String selectedDesaId = "";
  List<Iuran> iuranDesa = [];
  List<WargaDesa> wargaDesa = [];

  @override
  void onInit() {
    getIncomingData();
    super.onInit();
  }

  Future<void> getIncomingData() async {
    final desaCredential =
        await SecureStorageHelper.instance.getDesaCredential();

    selectedDesaId = desaCredential['id'];

    getWarga().then(
      (either) => either.fold(
        (error) {
          wargaDesa = [];
          update();
        },
        (warga) {
          wargaDesa = warga.listDesa ?? [];
          update();
        },
      ),
    );

    listenDesa().listen(
      (either) => either.fold(
        (error) {
          desa = Desa();
          update();
        },
        (data) {
          desa = data;
          update();
        },
      ),
    );

    listenTransactionDesa().listen(
      (either) => either.fold(
        (error) {
          iuranDesa = [];
          update();
        },
        (list) {
          iuranDesa = list;
          update();
        },
      ),
    );
  }

  Future<void> selectDesa(WargaDesa desa) async {
    selectedDesaId = desa.desaId ?? "";
    final jsonData = {
      'id': desa.desaId,
      'unique_code': desa.uniqueCode,
    };
    await SecureStorageHelper.instance.saveDesaCredential(jsonData);
    update();
  }
}
