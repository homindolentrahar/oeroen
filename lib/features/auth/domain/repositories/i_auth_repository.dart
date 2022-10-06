import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:oeroen/features/auth/domain/models/auth_user.dart';

abstract class IAuthRepository {
  Stream<Either<String, AuthUser>> authStateChanges();

  Future<Either<String, Unit>> verifyPhoneNumber(
    String phoneNumber, {
    void Function(PhoneAuthCredential credential)? verificationCompleted,
    void Function(FirebaseAuthException exception)? verificationFailed,
    void Function(String verificationId, int? resendToken)? codeSent,
    void Function(String verificationId)? codeAutoRetrievalTimeout,
  });

  Future<Either<String, Unit>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<String, Unit>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<String, Unit>> signInWithGoogle();

  Future<Either<String, Unit>> signInWithOtp({
    required String verificationId,
    required String otpCode,
  });

  Future<Either<String, Unit>> forgotPassword(String email);

  Future<Either<String, Unit>> signOut();
}
