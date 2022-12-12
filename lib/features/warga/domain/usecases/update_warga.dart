import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/warga/domain/repositories/i_warga_repository.dart';

class UpdateWarga {
  final IWargaRepository _repository;

  UpdateWarga(this._repository);

  Future<Either<AppError, Unit>> call(
          {required String wargaId, required Map<String, dynamic> data}) =>
      _repository.updateWarga(wargaId: wargaId, data: data);
}
