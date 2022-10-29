import 'package:dartz/dartz.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';

class SignInWithEmailAndPassword {
  final IAuthRepository _repository;

  SignInWithEmailAndPassword(IAuthRepository repository)
      : _repository = repository;

  Future<Either<String, Unit>> call({
    required String email,
    required String password,
  }) =>
      _repository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
}
