import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/transaction/domain/models/warga_transaction.dart';
import 'package:oeroen/features/transaction/domain/repositories/i_warga_transaction_repository.dart';

class GetTransaction {
  final IWargaTransactionRepository _repository;

  GetTransaction(this._repository);

  Future<Either<AppError, WargaTransaction>> call(String id) {
    return _repository.getDetailTransaction(id);
  }
}
