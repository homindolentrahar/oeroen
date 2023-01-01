import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';

abstract class IDesaRepository {
  Stream<Either<AppError, List<Desa>>> listenAllDesa();

  Stream<Either<AppError, Desa>> listenDetailDesa();

  Future<Either<AppError, List<Desa>>> getAllDesa();

  Future<Either<AppError, Desa>> getDetailDesa(String desaCode);
}
