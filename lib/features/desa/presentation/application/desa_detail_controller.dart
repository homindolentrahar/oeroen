import 'package:get/get.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';
import 'package:oeroen/features/desa/domain/usecases/listen_desa.dart';

class DesaDetailController extends GetxController {
  final ListenDesa listenDesa;

  DesaDetailController({
    required this.listenDesa,
  });

  Desa desa = Desa();

  @override
  void onInit() {
    final param = Get.parameters['id'] ?? "";
    listenDesa(param).listen(
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
    super.onInit();
  }
}
