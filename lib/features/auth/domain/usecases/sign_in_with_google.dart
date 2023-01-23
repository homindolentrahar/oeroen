import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';

class SignInWithGoogle {
  final IAuthRepository _repository;

  SignInWithGoogle(IAuthRepository repository) : _repository = repository;

  Future<Either<AppError, Unit>> call(
          {AuthRoleType type = AuthRoleType.warga}) =>
      _repository.signInWithGoogle(type: type);
}
