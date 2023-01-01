import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/transaction/domain/repositories/i_warga_transaction_repository.dart';

class UpdateTransaction {
  final IWargaTransactionRepository _repository;

  UpdateTransaction(this._repository);

  Future<Either<AppError, Unit>> call({
    required String id,
    required Map<String, dynamic> data,
  }) {
    return _repository.updateTransaction(id: id, data: data);
  }
}
