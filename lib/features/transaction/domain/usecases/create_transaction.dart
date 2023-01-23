import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/transaction/domain/models/warga_transaction.dart';
import 'package:oeroen/features/transaction/domain/repositories/i_warga_transaction_repository.dart';

class CreateTransaction {
  final IWargaTransactionRepository _repository;

  CreateTransaction(this._repository);

  Future<Either<AppError, Unit>> call(WargaTransaction data) {
    return _repository.createTransaction(data);
  }
}
