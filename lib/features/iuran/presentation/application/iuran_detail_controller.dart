import 'package:get/get.dart';

class IuranDetailController extends GetxController {
  late String title;

  @override
  void onInit() {
    final data = Get.arguments as Map<String, dynamic>;
    title = data['title'] ?? "";

    super.onInit();
  }
}
