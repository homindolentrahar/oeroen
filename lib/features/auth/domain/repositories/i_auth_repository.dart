import 'package:dartz/dartz.dart';
import 'package:oeroen/features/auth/domain/models/auth_user.dart';

abstract class IAuthRepository {
  Stream<Either<String, AuthUser>> authStateChanges();

  Future<Either<String, Unit>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<String, Unit>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<String, Unit>> signInWithGoogle();

  Future<Either<String, Unit>> signOut();
}
