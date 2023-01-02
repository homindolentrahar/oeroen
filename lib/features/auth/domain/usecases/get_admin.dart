import 'package:dartz/dartz.dart';
import 'package:oeroen/core/domain/models/admin.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';

class GetAdmin {
  final IAuthRepository _repository;

  GetAdmin(this._repository);

  Future<Option<Admin>> call() {
    return _repository.getAdminById();
  }
}
