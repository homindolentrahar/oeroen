import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oeroen/core/data/remote/warga_dto.dart';
import 'package:oeroen/core/domain/models/warga.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:oeroen/features/warga/domain/repositories/i_warga_repository.dart';
import 'package:oeroen/utils/extension/firestore_extensions.dart';

class WargaRepository implements IWargaRepository {
  final FirebaseFirestore _firestore;

  WargaRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Future<Either<AppError, Warga>> getWarga(String wargaId) async {
    try {
      final data = await _firestore
          .wargaCollection()
          .doc(wargaId)
          .withConverter<WargaDto>(
            fromFirestore: (snapshot, _) {
              final dto = WargaDto.fromJson(snapshot.data()!);

              dto.userId = wargaId;

              return dto;
            },
            toFirestore: (warga, _) => warga.toJson(),
          )
          .get();
      final model = data.data()?.toModel() ?? Warga();

      return right(model);
    } on FirebaseException catch (e) {
      return left(AppError(code: e.code, message: e.message.toString()));
    } on Exception catch (e) {
      return left(AppError(code: e.toString(), message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, Unit>> addWarga(Warga warga) async {
    try {
      await _firestore
          .wargaCollection()
          .doc(warga.userId)
          .set(WargaDto.fromModel(warga).toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      return left(AppError(code: e.code, message: e.message.toString()));
    } on Exception catch (e) {
      return left(AppError(code: e.toString(), message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, Unit>> updateWarga({
    required String wargaId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.wargaCollection().doc(wargaId).update(data);

      return right(unit);
    } on FirebaseException catch (e) {
      return left(AppError(code: e.code, message: e.message.toString()));
    } on Exception catch (e) {
      return left(AppError(code: e.toString(), message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, Unit>> deleteWarga(String wargaId) async {
    try {
      await _firestore.wargaCollection().doc(wargaId).delete();

      return right(unit);
    } on FirebaseException catch (e) {
      return left(AppError(code: e.code, message: e.message.toString()));
    } on Exception catch (e) {
      return left(AppError(code: e.toString(), message: e.toString()));
    }
  }
}
