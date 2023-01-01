import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:oeroen/features/auth/domain/models/auth_user.dart';

enum AuthRoleType { warga, admin }

abstract class IAuthRepository {
  Stream<Future<Option<AuthUser>>> authStateChanges();

  Option<AuthUser> get currentUser;

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
    AuthRoleType type = AuthRoleType.warga,
  });

  Future<Either<String, Unit>> forgotPassword(String email);

  Future<Either<String, Unit>> sendVerificationEmail(String email);

  Future<void> reload();

  Future<Either<String, Unit>> signOut();
}
