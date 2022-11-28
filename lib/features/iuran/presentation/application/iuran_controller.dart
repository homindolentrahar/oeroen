import 'package:get/get.dart';
import 'package:oeroen/core/domain/models/iuran_filter.dart';

class IuranController  extends GetxController{
  int iuranMenuIndex = 0;
  List<IuranFilter> filters = [];

  void iuranMenuChanged(int index){
    iuranMenuIndex = index;
    update();
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