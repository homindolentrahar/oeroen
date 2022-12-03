import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/iuran/domain/models/iuran.dart';
import 'package:oeroen/features/iuran/domain/repositories/i_iuran_repository.dart';

class ListenAllIuran {
  final IIuranRepository _repository;

  ListenAllIuran(this._repository);

  Stream<Either<AppError, List<Iuran>>> call() => _repository.listenAllIuran();
}
