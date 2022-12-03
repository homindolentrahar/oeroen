import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/iuran/domain/models/iuran.dart';
import 'package:oeroen/features/iuran/domain/repositories/i_iuran_repository.dart';

class GetIuran {
  final IIuranRepository _repository;

  GetIuran(this._repository);

  Future<Either<AppError, Iuran>> call(String iuranId) =>
      _repository.getIuran(iuranId);
}
