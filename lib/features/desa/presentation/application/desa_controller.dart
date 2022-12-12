import 'package:get/get.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';
import 'package:oeroen/features/desa/domain/usecases/listen_desa.dart';
import 'package:oeroen/features/desa/domain/usecases/listen_transaction_desa.dart';
import 'package:oeroen/features/iuran/domain/models/iuran.dart';

class DesaController extends GetxController {
  final ListenDesa listenDesa;
  final ListenTransactionDesa listenTransactionDesa;

  DesaController({
    required this.listenDesa,
    required this.listenTransactionDesa,
  });

  Desa desa = Desa();
  List<Iuran> iuranDesa = [];

  @override
  void onInit() {
    getIncomingData();
    super.onInit();
  }

  Future<void> getIncomingData() async {
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
}
