import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/core/domain/models/warga.dart';
import 'package:oeroen/features/warga/domain/repositories/i_warga_repository.dart';

class GetWarga {
  final IWargaRepository _repository;

  GetWarga(this._repository);

  Future<Either<AppError, Warga>> call(String wargaId) =>
      _repository.getWarga(wargaId);
}
