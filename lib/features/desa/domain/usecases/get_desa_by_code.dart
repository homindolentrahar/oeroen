import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';
import 'package:oeroen/features/desa/domain/repositories/i_desa_repository.dart';

class GetDesaByCode{
  final IDesaRepository _repository;

  GetDesaByCode(this._repository);

  Future<Either<AppError,Desa>> call(String desaCode) => _repository.getDetailDesa(desaCode);
}