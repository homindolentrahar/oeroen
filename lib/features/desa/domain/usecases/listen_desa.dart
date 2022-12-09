import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';
import 'package:oeroen/features/desa/domain/repositories/i_desa_repository.dart';

class ListenDesa {
  final IDesaRepository _repository;

  ListenDesa(this._repository);

  Stream<Either<AppError, Desa>> call(String desaId) =>
      _repository.getDetailDesa(desaId);
}
