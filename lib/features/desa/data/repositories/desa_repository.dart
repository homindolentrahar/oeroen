import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:oeroen/utils/helper/secure_storage_helper.dart';
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
  Stream<Either<AppError, List<Desa>>> listenAllDesa() async* {
    final userId = await SecureStorageHelper.instance.getUserCredential();
    yield* _firestore
        .desaCollection()
        .where('admin_id', isEqualTo: userId)
        .withConverter<DesaDto>(
          fromFirestore: (snapshot, _) {
            final dto = DesaDto.fromJson(snapshot.data()!);
            dto.id = snapshot.id;
            return dto;
          },
          toFirestore: (desa, _) => desa.toJson(),
        )
        .snapshots()
        .map((query) {
      final dtos = query.docs.map((e) => e.data()).toList();
      final models = dtos.map((e) => e.toModel()).toList();

      return right<AppError, List<Desa>>(models);
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

  @override
  Stream<Either<AppError, Desa>> listenDetailDesa() async* {
    final desaCredential =
        await SecureStorageHelper.instance.getDesaCredential();

    yield* _firestore
        .desaCollection()
        .doc(desaCredential['id'])
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

  @override
  Future<Either<AppError, List<Desa>>> getAllDesa() async {
    try {
      final userId = await SecureStorageHelper.instance.getUserCredential();
      final snapshot = await _firestore
          .desaCollection()
          .where('admin_id', isEqualTo: userId)
          .withConverter<DesaDto>(
            fromFirestore: (snapshot, _) {
              final dto = DesaDto.fromJson(snapshot.data()!);
              dto.id = snapshot.id;
              return dto;
            },
            toFirestore: (iuran, _) => iuran.toJson(),
          )
          .get();
      snapshot.docs.map((e) {
        Logger().i("Desas: ${e.data().toJson()}");
      }).toList();

      final dtos = snapshot.docs.map((e) => e.data()).toList();
      final models = dtos.map((e) => e.toModel()).toList();

      return right(models);
    } on FirebaseException catch (e) {
      return left(AppError(code: e.code, message: e.message.toString()));
    } on Exception catch (e) {
      return left(AppError(code: e.toString(), message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, Desa>> getDetailDesa(String desaCode) async {
    try {
      final snapshot = await _firestore
          .desaCollection()
          .where('unique_code', isEqualTo: desaCode)
          .withConverter<DesaDto>(
            fromFirestore: (snapshot, _) {
              final dto = DesaDto.fromJson(snapshot.data()!);
              dto.id = snapshot.id;
              return dto;
            },
            toFirestore: (iuran, _) => iuran.toJson(),
          )
          .get();

      if (snapshot.size <= 0) {
        return left(AppError(
            code: "desa-not-found", message: "Data desa tidak ditemukan"));
      }

      final model = snapshot.docs.first.data().toModel();
      return right(model);
    } on FirebaseException catch (e) {
      return left(AppError(code: e.code, message: e.message.toString()));
    } on Exception catch (e) {
      return left(AppError(code: e.toString(), message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, Unit>> addDesa(Desa data) async {
    try {
      await _firestore
          .desaCollection()
          .doc(data.id)
          .set(DesaDto.fromModel(data).toJson());

      return right(unit);
    } on FirebaseException catch (e) {
      return left(AppError(code: e.code, message: e.message.toString()));
    } on Exception catch (e) {
      return left(AppError(code: e.toString(), message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, Unit>> deleteDesa(String id) async {
    try {
      await _firestore.desaCollection().doc(id).delete();

      return right(unit);
    } on FirebaseException catch (e) {
      return left(AppError(code: e.code, message: e.message.toString()));
    } on Exception catch (e) {
      return left(AppError(code: e.toString(), message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, Unit>> updateDesa({
    required String id,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.desaCollection().doc(id).update(data);

      return right(unit);
    } on FirebaseException catch (e) {
      return left(AppError(code: e.code, message: e.message.toString()));
    } on Exception catch (e) {
      return left(AppError(code: e.toString(), message: e.toString()));
    }
  }
}
