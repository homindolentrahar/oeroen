import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';

abstract class IDesaRepository {
  Stream<Either<AppError, List<Desa>>> listenAllDesa();

  Stream<Either<AppError, Desa>> listenDetailDesa();

  Future<Either<AppError, List<Desa>>> getAllDesa();

  Future<Either<AppError, Desa>> getDetailDesa(String desaCode);

  Future<Either<AppError, Unit>> addDesa(Desa data);

  Future<Either<AppError, Unit>> updateDesa({
    required String id,
    required Map<String, dynamic> data,
  });

  Future<Either<AppError, Unit>> deleteDesa(String id);
}
