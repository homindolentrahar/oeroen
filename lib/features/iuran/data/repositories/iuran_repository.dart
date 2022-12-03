import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/iuran/data/remote/dto/iuran_dto.dart';
import 'package:oeroen/features/iuran/domain/models/iuran.dart';
import 'package:oeroen/features/iuran/domain/repositories/i_iuran_repository.dart';
import 'package:oeroen/utils/firestore_extensions.dart';

class IuranRepository implements IIuranRepository {
  final FirebaseFirestore _firestore;

  IuranRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Stream<Either<AppError, List<Iuran>>> listenAllIuran() async* {
    yield* _firestore
        .iuranCollection()
        .withConverter<IuranDto>(
          fromFirestore: (snapshot, _) => IuranDto.fromJson(snapshot.data()!),
          toFirestore: (iuran, _) => iuran.toJson(),
        )
        .snapshots()
        .map((query) {
      final dtos = query.docs.map((snapshot) => snapshot.data()).toList();
      final models = dtos.map((e) => e.toModel()).toList();

      return right<AppError, List<Iuran>>(models);
    }).onErrorReturnWith(
      (error, stackTrace) {
        if (error is FirebaseException) {
          Logger().e(error.message.toString());
          return left(
            AppError(code: error.code, message: error.message.toString()),
          );
        }
        return left(
          AppError(code: error.toString(), message: error.toString()),
        );
      },
    );
  }

  @override
  Future<Either<AppError, Iuran>> getIuran(String iuranId) async {
    try {
      final snapshot = await _firestore
          .iuranCollection()
          .doc(iuranId)
          .withConverter<IuranDto>(
            fromFirestore: (snapshot, _) => IuranDto.fromJson(snapshot.data()!),
            toFirestore: (iuran, _) => iuran.toJson(),
          )
          .get();
      final model = snapshot.data()?.toModel() ?? Iuran();
      return right(model);
    } on FirebaseException catch (e) {
      return left(AppError(code: e.code, message: e.message.toString()));
    } on Exception catch (e) {
      return left(AppError(code: e.toString(), message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, Unit>> markIuranPaid(String iuranId) async {
    try {
      await _firestore.iuranCollection().doc(iuranId).update({
        'is_paid': true,
      });
      return right(unit);
    } on FirebaseException catch (e) {
      return left(AppError(code: e.code, message: e.message.toString()));
    } on Exception catch (e) {
      return left(AppError(code: e.toString(), message: e.toString()));
    }
  }
}
