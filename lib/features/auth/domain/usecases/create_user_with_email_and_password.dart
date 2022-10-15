import 'package:dartz/dartz.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';

class CreateUserWithEmailAndPassword {
  final IAuthRepository _repository;

  CreateUserWithEmailAndPassword(IAuthRepository repository)
      : _repository = repository;

  Future<Either<String, Unit>> call({
    required String email,
    required String password,
  }) =>
      _repository.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
}
