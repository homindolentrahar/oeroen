import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/iuran/domain/models/iuran.dart';
import 'package:oeroen/features/iuran/domain/repositories/i_iuran_repository.dart';

class ListenActiveIuran {
  final IIuranRepository _repository;

  ListenActiveIuran(this._repository);

  Stream<Either<AppError, List<Iuran>>> call() =>
      _repository.listenAllIuran().map(
            (either) => either.map(
              (list) => list.where(
                (item) {
                  return (item.isPaid == null || item.isPaid == false) &&
                      item.paidAt == null;
                },
              ).toList(),
            ),
          );
}
