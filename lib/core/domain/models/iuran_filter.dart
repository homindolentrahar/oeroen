import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oeroen/core/domain/models/iuran_category.dart';
import 'package:oeroen/core/domain/models/iuran_sort.dart';

part 'iuran_filter.freezed.dart';

enum PaidType { paid, due }

@freezed
class IuranFilter with _$IuranFilter {
  const factory IuranFilter({
    IuranCategory? category,
    IuranSort? sort,
    PaidType? paidType,
  }) = _IuranFilter;
}
