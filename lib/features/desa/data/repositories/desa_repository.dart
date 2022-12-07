import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
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
  Future<Either<AppError, Desa>> getDetailDesa(String uniqueCode) async {
    try {
      final snapshot = await _firestore
          .desaCollection()
          .doc(uniqueCode)
          .withConverter<DesaDto>(
            fromFirestore: (snapshot, _) => DesaDto.fromJson(snapshot.data()!),
            toFirestore: (desa, _) => desa.toJson(),
          )
          .get();
      final model = snapshot.data()?.toModel() ?? Desa();
      return right(model);
    } on FirebaseException catch (e) {
      return left(AppError(code: e.code, message: e.message.toString()));
    } on Exception catch (e) {
      return left(AppError(code: e.toString(), message: e.toString()));
    }
  }
}
