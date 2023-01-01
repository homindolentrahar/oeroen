import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/desa/domain/repositories/i_desa_repository.dart';

class DeleteDesa {
  final IDesaRepository _repository;

  DeleteDesa(this._repository);

  Future<Either<AppError, Unit>> call(String id) {
    return _repository.deleteDesa(id);
  }
}
