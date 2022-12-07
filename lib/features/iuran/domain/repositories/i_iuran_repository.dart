import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/iuran/domain/models/iuran.dart';

abstract class IIuranRepository {
  Stream<Either<AppError, List<Iuran>>> listenAllIuran({
    String categoryFilter = "",
    String sortFilter = "",
    bool isPaid = false,
  });

  Future<Either<AppError, Iuran>> getIuran(String iuranId);

  Future<Either<AppError, Unit>> markIuranPaid(String iuranId);
}
