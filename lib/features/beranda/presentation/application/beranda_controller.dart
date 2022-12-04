import 'package:get/get.dart';
import 'package:oeroen/features/iuran/domain/models/iuran.dart';
import 'package:oeroen/features/iuran/domain/usecases/listen_active_iuran.dart';
import 'package:oeroen/features/iuran/domain/usecases/listen_paid_iuran.dart';

class BerandaController extends GetxController {
  final ListenActiveIuran listenActiveIuran;
  final ListenPaidIuran listenPaidIuran;

  BerandaController({
    required this.listenPaidIuran,
    required this.listenActiveIuran,
  });

  List<Iuran> activeIuran = [];
  List<Iuran> paidIuran = [];
  double activeAmount = 0.0;

  @override
  void onInit() {
    listenPaidIuran().listen(
      (either) => either.fold(
        (error) {
          paidIuran = [];
          update();
        },
        (list) {
          paidIuran = list
            ..sort(
              (a, b) =>
                  b.createdAt?.compareTo(a.createdAt ?? DateTime.now()) ?? 0,
            );
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
