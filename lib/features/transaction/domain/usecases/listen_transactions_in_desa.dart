import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/iuran/domain/models/iuran_filter.dart';
import 'package:oeroen/features/transaction/domain/models/warga_transaction.dart';
import 'package:oeroen/features/transaction/domain/repositories/i_warga_transaction_repository.dart';

class ListenTransactionsInDesa {
  final IWargaTransactionRepository _repository;

  ListenTransactionsInDesa(this._repository);

  Stream<Either<AppError, List<WargaTransaction>>> call({
    List<IuranFilter> filters = const [],
    bool isPaid = false,
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
    return _repository.listenTransactionsInDesa(
      categoryFilter: categoryFilter,
      sortFilter: sortFilter,
      isPaid: isPaid,
    );
  }
}
