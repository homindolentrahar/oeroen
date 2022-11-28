import 'package:get/get.dart';
import 'package:oeroen/core/domain/models/iuran_filter.dart';

class IuranFilterController extends GetxController {
  IuranFilter? category;
  IuranFilter? sort;
  IuranFilter? paidType;

  void setFilters(List<IuranFilter> value) {
    category =
        value.firstWhereOrNull((item) => item.type == IuranFilterType.category);
    sort = value.firstWhereOrNull((item) => item.type == IuranFilterType.sort);
    paidType =
        value.firstWhereOrNull((item) => item.type == IuranFilterType.paidType);
    update();
  }

  void categoryChanged(IuranFilter? value) {
    category = value;
    update();
  }

  void sortChanged(IuranFilter? value) {
    sort = value;
    update();
  }

  void paidTypeChanged(IuranFilter? value) {
    paidType = value;
    update();
  }
}
