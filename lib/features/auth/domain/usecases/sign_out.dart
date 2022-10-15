import 'package:dartz/dartz.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';

class SignOut {
  final IAuthRepository _repository;

  SignOut(IAuthRepository repository) : _repository = repository;

  Future<Either<String, Unit>> call() => _repository.signOut();
}
