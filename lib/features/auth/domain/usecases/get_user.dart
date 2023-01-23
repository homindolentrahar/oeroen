import 'package:dartz/dartz.dart';
import 'package:oeroen/features/auth/domain/models/auth_user.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';

class GetUser {
  final IAuthRepository _repository;

  GetUser(this._repository);

  Future<Option<AuthUser>> call() {
    return _repository.getUserById();
  }
}
