import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/desa/domain/repositories/i_desa_repository.dart';

class UpdateDesa {
  final IDesaRepository _repository;

  UpdateDesa(this._repository);

  Future<Either<AppError, Unit>> call({
    required String id,
    required Map<String, dynamic> data,
  }) {
    return _repository.updateDesa(id: id, data: data);
  }
}
