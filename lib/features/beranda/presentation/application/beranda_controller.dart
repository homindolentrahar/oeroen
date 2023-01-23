import 'package:get/get.dart';
import 'package:oeroen/features/transaction/domain/models/warga_transaction.dart';
import 'package:oeroen/features/transaction/domain/usecases/listen_transactions_in_desa.dart';

class BerandaController extends GetxController {
  final ListenTransactionsInDesa listenTransactionsInDesa;

  BerandaController({
    required this.listenTransactionsInDesa,
  });

  List<WargaTransaction>? transactions;
  List<WargaTransaction>? paidTransactions;
  double activeAmount = 0.0;

  @override
  void onInit() {
    listenIncomingData();

    super.onInit();
  }

  void listenIncomingData() {
    listenTransactionsInDesa(
      isPaid: true,
    ).listen((either) {
      either.fold(
        (error) {
          paidTransactions = [];
          update();
        },
        (list) {
          paidTransactions = list;

          update();
        },
      );
    });
    listenTransactionsInDesa().listen((either) {
      either.fold(
        (error) {
          transactions = [];
          update();
        },
        (list) {
          transactions = list;
          activeAmount = list.fold(
            0.0,
            (previousValue, element) => previousValue += element.amount ?? 0.0,
          );
          update();
        },
      );
    });
  }
}
