import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/transaction/domain/repositories/i_warga_transaction_repository.dart';

class DeleteTransaction {
  final IWargaTransactionRepository _repository;

  DeleteTransaction(this._repository);

  Future<Either<AppError, Unit>> call(String id) {
    return _repository.deleteTransaction(id);
  }
}
