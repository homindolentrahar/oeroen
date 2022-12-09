import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/desa/data/remote/dto/desa_dto.dart';
import 'package:oeroen/features/desa/domain/models/desa.dart';
import 'package:oeroen/features/desa/domain/repositories/i_desa_repository.dart';
import 'package:oeroen/utils/extension/firestore_extensions.dart';

class DesaRepository implements IDesaRepository {
  final FirebaseFirestore _firestore;

  DesaRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Stream<Either<AppError, Desa>> getDetailDesa(String desaId) async* {
    yield* _firestore
        .desaCollection()
        .doc(desaId)
        .withConverter<DesaDto>(
          fromFirestore: (snapshot, _) => DesaDto.fromJson(snapshot.data()!),
          toFirestore: (desa, _) => desa.toJson(),
        )
        .snapshots()
        .map((docSnapshot) {
      final dto = docSnapshot.data();
      final model = dto?.toModel() ?? Desa();

      return right<AppError, Desa>(model);
    }).onErrorReturnWith((error, stackTrace) {
      if (error is FirebaseException) {
        Logger().e(error.message.toString());
        return left(
          AppError(code: error.code, message: error.message.toString()),
        );
      }
      return left(
        AppError(code: error.toString(), message: error.toString()),
      );
    });
  }
}
