import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';
import 'package:oeroen/features/desa/domain/repositories/i_desa_repository.dart';

class GetAllDesa {
  final IDesaRepository _repository;

  GetAllDesa(this._repository);

  Future<Either<AppError, List<Desa>>> call() {
    return _repository.getAllDesa();
  }
}
