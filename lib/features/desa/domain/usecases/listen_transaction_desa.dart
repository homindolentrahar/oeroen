import 'package:dartz/dartz.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/iuran/domain/models/iuran.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_filter.dart';
import 'package:oeroen/features/iuran/domain/repositories/i_iuran_repository.dart';

class ListenTransactionDesa {
  final IIuranRepository _repository;

  ListenTransactionDesa(this._repository);

  Stream<Either<AppError, List<Iuran>>> call({
    List<IuranFilter> filters = const [],
  }) {
    String categoryFilter = "";
    String sortFilter = "";

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
    }

    return _repository.listenAllIuran(
      categoryFilter: categoryFilter,
      sortFilter: sortFilter,
      isPaid: "true",
      desaCode: Constants.dummyDesaCode,
    );
  }
}
