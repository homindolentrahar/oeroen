import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/iuran/domain/repositories/i_iuran_repository.dart';

class MarkIuranPaid {
  final IIuranRepository _repository;

  MarkIuranPaid(this._repository);

  Future<Either<AppError, Unit>> call(String iuranId) =>
      _repository.markIuranPaid(iuranId);
}
