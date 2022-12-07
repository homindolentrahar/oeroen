import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/iuran/domain/models/iuran.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_filter.dart';
import 'package:oeroen/features/iuran/domain/repositories/i_iuran_repository.dart';

class ListenAllIuran {
  final IIuranRepository _repository;

  ListenAllIuran(this._repository);

  Stream<Either<AppError, List<Iuran>>> call({
    List<IuranFilter> filters = const [],
  }) {
    String categoryFilter = "";
    String sortFilter = "";
    bool paidFilter = false;

    if (filters.isNotEmpty) {
      categoryFilter = filters
              .firstWhere(
                (e) => e.type == IuranFilterType.category,
                orElse: () => IuranFilter(),
              )
              .slug ??
          "";
      sortFilter = filters
              .firstWhere(
                (e) => e.type == IuranFilterType.sort,
                orElse: () => IuranFilter(),
              )
              .slug ??
          "";
      paidFilter = filters
                  .firstWhere((e) => e.type == IuranFilterType.paidType,
                      orElse: () => IuranFilter())
                  .slug ==
              "paid"
          ? true
          : false;
    }
    return _repository.listenAllIuran(
      categoryFilter: categoryFilter,
      sortFilter: sortFilter,
      isPaid: paidFilter,
    );
  }
}
