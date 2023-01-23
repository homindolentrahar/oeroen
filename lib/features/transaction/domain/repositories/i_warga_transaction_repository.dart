import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/transaction/domain/models/warga_transaction.dart';

abstract class IWargaTransactionRepository {
  Stream<Either<AppError, List<WargaTransaction>>> listenTransactionsInDesa({
    String categoryFilter = "",
    String sortFilter = "",
    bool isPaid = false,
    String desaCode = "",
  });

  Future<Either<AppError, WargaTransaction>> getDetailTransaction(String id);

  Future<Either<AppError, Unit>> createTransaction(WargaTransaction data);

  Future<Either<AppError, Unit>> updateTransaction({
    required String id,
    required Map<String, dynamic> data,
  });

  Future<Either<AppError, Unit>> deleteTransaction(String id);

  Future<Either<AppError, Unit>> markTransactionPaid(String iuranId);
}
