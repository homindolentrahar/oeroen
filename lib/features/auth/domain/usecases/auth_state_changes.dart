import 'package:dartz/dartz.dart';
import 'package:oeroen/features/auth/domain/models/auth_user.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';

class AuthStateChanges {
  final IAuthRepository _repository;

  AuthStateChanges(IAuthRepository repository) : _repository = repository;

  Stream<Future<Option<AuthUser>>> call() => _repository.authStateChanges();
}
