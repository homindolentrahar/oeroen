import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/utils/extension/string_extensions.dart';
import 'package:oeroen/utils/helper/secure_storage_helper.dart';
import 'package:rxdart/rxdart.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/iuran/data/remote/dto/iuran_dto.dart';
import 'package:oeroen/features/iuran/domain/models/iuran.dart';
import 'package:oeroen/features/iuran/domain/repositories/i_iuran_repository.dart';
import 'package:oeroen/utils/extension/firestore_extensions.dart';

class IuranRepository implements IIuranRepository {
  final FirebaseFirestore _firestore;

  IuranRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Stream<Either<AppError, List<Iuran>>> listenAllIuran({
    String categoryFilter = "",
    String sortFilter = "",
    String isPaid = "",
    bool allDesa = true,
  }) async* {
    final userId = await SecureStorageHelper.instance.getUserCredential();
    final savedDesaCode =
        (await SecureStorageHelper.instance.getDesaCredential())['unique_code'];
    final orderBy = iuranFilterOrderByMap[sortFilter];

    var query =
        _firestore.iuranCollection().where('user_id', isEqualTo: userId);

    if (allDesa == false) {
      query = query.where('desa_code', isEqualTo: savedDesaCode);
    }

    if (categoryFilter.isNotEmpty) {
      query = query.where('category_slug', isEqualTo: categoryFilter);
    }

    if (isPaid.isNotEmpty) {
      final isPaidBool = isPaid.parseBool();
      query = query.where('is_paid', isEqualTo: isPaidBool);
    }

    yield* query
        .orderBy(
          orderBy?.orderField ?? "created_at",
          descending: orderBy?.descending ?? true,
        )
        .withConverter<IuranDto>(
          fromFirestore: (snapshot, _) {
            final dto = IuranDto.fromJson(snapshot.data()!);

            dto.id = snapshot.id;

            return dto;
          },
          toFirestore: (iuran, _) => iuran.toJson(),
        )
        .snapshots()
        .map((query) {
      final dtos = query.docs.map((e) => e.data()).toList();
      final models = dtos.map((e) => e.toModel()).toList();

      return right<AppError, List<Iuran>>(models);
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
  Future<Either<AppError, Iuran>> getIuran(String iuranId) async {
    try {
      final snapshot = await _firestore
          .iuranCollection()
          .doc(iuranId)
          .withConverter<IuranDto>(
            fromFirestore: (snapshot, _) {
              final dto = IuranDto.fromJson(snapshot.data()!);

              dto.id = snapshot.id;

              return dto;
            },
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
