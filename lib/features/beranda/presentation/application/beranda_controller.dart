import 'package:get/get.dart';
import 'package:oeroen/features/iuran/domain/models/iuran.dart';
import 'package:oeroen/features/iuran/domain/usecases/listen_active_iuran.dart';
import 'package:oeroen/features/iuran/domain/usecases/listen_transaction_iuran.dart';

class BerandaController extends GetxController {
  final ListenActiveIuran listenActiveIuran;
  final ListenTransactionIuran listenTransactionIuraan;

  BerandaController({
    required this.listenTransactionIuraan,
    required this.listenActiveIuran,
  });

  List<Iuran> activeIuran = [];
  List<Iuran> paidIuran = [];
  double activeAmount = 0.0;

  @override
  void onInit() {
    listenTransactionIuraan().listen(
      (either) => either.fold(
        (error) {
          paidIuran = [];
          update();
        },
        (list) {
          paidIuran = list;
          update();
        },
      ),
    );
    listenActiveIuran().listen(
      (either) => either.fold(
        (error) {
          activeIuran = [];
          update();
        },
        (list) {
          activeIuran = list;
          activeAmount = list.fold(
            0.0,
            (previousValue, element) => previousValue += element.amount ?? 0.0,
          );
          update();
        },
      ),
    );

    super.onInit();
  }
}
