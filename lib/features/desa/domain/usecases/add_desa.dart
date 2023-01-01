import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';
import 'package:oeroen/features/desa/domain/repositories/i_desa_repository.dart';

class AddDesa {
  final IDesaRepository _repository;

  AddDesa(this._repository);

  Future<Either<AppError, Unit>> call(Desa data) {
    return _repository.addDesa(data);
  }
}
