import 'package:get/get.dart';
import 'package:oeroen/features/iuran/domain/models/iuran.dart';
import 'package:oeroen/features/iuran/domain/usecases/listen_active_iuran.dart';

class BerandaController extends GetxController {
  final ListenActiveIuran listenActiveIuran;

  BerandaController({required this.listenActiveIuran});

  List<Iuran> activeIuran = [];
  double activeAmount = 0.0;

  @override
  void onInit() {
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
