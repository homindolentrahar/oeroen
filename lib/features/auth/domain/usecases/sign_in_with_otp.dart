import 'package:dartz/dartz.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';

class SignInWithOtp {
  final IAuthRepository _repository;

  SignInWithOtp(IAuthRepository repository) : _repository = repository;

  Future<Either<String, Unit>> call({
    required String verificationId,
    required String otpCode,
  }) =>
      _repository.signInWithOtp(
        verificationId: verificationId,
        otpCode: otpCode,
      );
}
