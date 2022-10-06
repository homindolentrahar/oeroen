import 'package:dartz/dartz.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';

class ForgotPassword {
  final IAuthRepository _repository;

  ForgotPassword(IAuthRepository repository) : _repository = repository;

  Future<Either<String, Unit>> call(String email) =>
      _repository.forgotPassword(email);
}
