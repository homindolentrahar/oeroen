import 'package:dartz/dartz.dart';
import 'package:oeroen/common/errors/app_error.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';

class VerifyPhoneNumber {
  final IAuthRepository _repository;

  VerifyPhoneNumber(IAuthRepository repository) : _repository = repository;

  Future<Either<String, Unit>> call(
    String phoneNumber, {
    required void Function(AppError exception) verificationFailed,
    required void Function(String verificationId, int? resendToken) codeSent,
    void Function(String verificationId)? codeAutoRetrievalTimeout,
  }) =>
      _repository.verifyPhoneNumber(
        phoneNumber,
        verificationCompleted: (credential) {},
        verificationFailed: (exception) => verificationFailed.call(
          AppError(code: exception.code, message: exception.message.toString()),
        ),
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        codeSent: codeSent,
      );
}
