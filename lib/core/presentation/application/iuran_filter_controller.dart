import 'package:get/get.dart';
import 'package:oeroen/core/domain/models/iuran_category.dart';
import 'package:oeroen/core/domain/models/iuran_filter.dart';
import 'package:oeroen/core/domain/models/iuran_sort.dart';

class IuranFilterController extends GetxController {
  final Rx<IuranFilter> _state = const IuranFilter().obs;

  IuranFilter get state => _state.value;

  void _emit(IuranFilter filter) {
    _state.value = filter;
  }

  void selectCategory(IuranCategory? category) {
    IuranCategory? currentCategory;
    if (state.category?.categorySlug == category?.categorySlug &&
        state.category?.categoryName == category?.categoryName) {
      currentCategory = null;
    } else {
      currentCategory = category;
    }
    _emit(state.copyWith(
      category: currentCategory,
    ));
  }

  void selectSort(IuranSort? sort) {
    IuranSort? currentSort;
    if (state.sort?.sortName == sort?.sortName &&
        state.sort?.sortSlug == sort?.sortSlug) {
      currentSort = null;
    } else {
      currentSort = sort;
    }
    _emit(state.copyWith(
      sort: currentSort,
    ));
  }

  void selectPaidType(PaidType? type) {
    PaidType? currentPaidType;
    if (state.paidType == type) {
      currentPaidType = null;
    } else {
      currentPaidType = type;
    }
    _emit(state.copyWith(
      paidType: currentPaidType,
    ));
  }
}
