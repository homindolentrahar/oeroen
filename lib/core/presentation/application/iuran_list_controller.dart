import 'package:get/get.dart';
import 'package:oeroen/core/domain/models/iuran_filter.dart';

class IuranListController extends GetxController {
  late String title;
  late String slug;
  List<IuranFilter> filters = [];

  @override
  void onInit() {
    final Map<String, dynamic> additionalData = Get.arguments;
    title = additionalData['title'] ?? "";
    slug = additionalData['slug'] ?? "";

    super.onInit();
  }

  void setFilters(List<IuranFilter> value) {
    filters = value;
    update();
  }

  void removeFilter(IuranFilter value){
    filters.remove(value);
    update();
  }
}
