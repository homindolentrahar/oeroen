import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/core/domain/models/warga.dart';

abstract class IWargaRepository {
  Future<Either<AppError, Warga>> getWarga(String wargaId);

  Future<Either<AppError, Unit>> addWarga(Warga warga);

  Future<Either<AppError, Unit>> updateWarga({
    required String wargaId,
    required Map<String, dynamic> data,
  });

  Future<Either<AppError, Unit>> deleteWarga(String wargaId);
}
