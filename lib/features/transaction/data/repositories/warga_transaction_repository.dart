import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';
import 'package:oeroen/common/constant/constants.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:oeroen/features/transaction/data/remote/dto/warga_transaction_dto.dart';
import 'package:oeroen/features/transaction/domain/models/warga_transaction.dart';
import 'package:oeroen/features/transaction/domain/repositories/i_warga_transaction_repository.dart';
import 'package:oeroen/utils/extension/firestore_extensions.dart';
import 'package:oeroen/utils/helper/secure_storage_helper.dart';
import 'package:rxdart/rxdart.dart';

class WargaTransactionRepository implements IWargaTransactionRepository {
  final FirebaseFirestore _firestore;

  WargaTransactionRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Stream<Either<AppError, List<WargaTransaction>>> listenTransactionsInDesa({
    String categoryFilter = "",
    String sortFilter = "",
    bool isPaid = false,
    String desaCode = "",
  }) async* {
    final userCredential =
        await SecureStorageHelper.instance.getUserCredential();
    final desaCredential =
        await SecureStorageHelper.instance.getDesaCredential();
    final orderBy = iuranFilterOrderByMap[sortFilter];

    var query = _firestore.transactionCollection().where(
          'desa_id',
          isEqualTo: desaCredential['id'],
        );

    if (categoryFilter.isNotEmpty) {
      query = query.where('category_slug', isEqualTo: categoryFilter);
    }

    if (isPaid) {
      query = query.where(
        'paid_users.user_id',
        isNotEqualTo: userCredential,
      );
    }

    yield* query
        // .orderBy(
        //   orderBy?.orderField ?? "created_at",
        //   descending: orderBy?.descending ?? true,
        // )
        // _firestore
        //     .transactionCollection()
        //     .where('desa_id', isEqualTo: desaCredential['id'])
        .withConverter<WargaTransactionDto>(
          fromFirestore: (snapshot, _) {
            final dto = WargaTransactionDto.fromJson(snapshot.data()!);
            dto.id = snapshot.id;
            return dto;
          },
          toFirestore: (iuran, _) => iuran.toJson(),
        )
        .snapshots()
        .map((query) {
      final dtos = query.docs.map((e) => e.data()).toList();

      Logger().w(
          "Desa ID:${desaCredential['id']}\nData: ${dtos.map((e) => e.toJson()).toList()}");

      final models = dtos.map((e) => e.toModel()).toList();

      return right<AppError, List<WargaTransaction>>(models);
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
  Future<Either<AppError, WargaTransaction>> getDetailTransaction(
      String id) async {
    final snapshot = await _firestore
        .transactionCollection()
        .doc(id)
        .withConverter<WargaTransactionDto>(
          fromFirestore: (snapshot, _) {
            final dto = WargaTransactionDto.fromJson(snapshot.data()!);
            dto.id = snapshot.id;
            return dto;
          },
          toFirestore: (iuran, _) => iuran.toJson(),
        )
        .get();
    final model = snapshot.data()?.toModel() ?? WargaTransaction();
    return right(model);
  }

  @override
  Future<Either<AppError, Unit>> markTransactionPaid(String iuranId) async {
    try {
      await _firestore.transactionCollection().doc(iuranId).update({
        'is_paid': true,
      });
      return right(unit);
    } on FirebaseException catch (e) {
      return left(AppError(code: e.code, message: e.message.toString()));
    } on Exception catch (e) {
      return left(AppError(code: e.toString(), message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, Unit>> createTransaction(
    WargaTransaction data,
  ) async {
    try {
      await _firestore.transactionCollection().doc(data.id).set(
            WargaTransactionDto.fromModel(data).toJson(),
          );

      return right(unit);
    } on FirebaseException catch (e) {
      return left(AppError(code: e.code, message: e.message.toString()));
    } on Exception catch (e) {
      return left(AppError(code: e.toString(), message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, Unit>> deleteTransaction(String id) async {
    try {
      await _firestore.transactionCollection().doc(id).delete();

      return right(unit);
    } on FirebaseException catch (e) {
      return left(AppError(code: e.code, message: e.message.toString()));
    } on Exception catch (e) {
      return left(AppError(code: e.toString(), message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, Unit>> updateTransaction({
    required String id,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _firestore.transactionCollection().doc(id).update(data);

      return right(unit);
    } on FirebaseException catch (e) {
      return left(AppError(code: e.code, message: e.message.toString()));
    } on Exception catch (e) {
      return left(AppError(code: e.toString(), message: e.toString()));
    }
  }
}
