import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oeroen/features/auth/data/remote/firebase/firebase_auth_user.dart';
import 'package:oeroen/features/auth/domain/models/auth_user.dart';
import 'package:oeroen/features/auth/domain/repositories/i_auth_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:logger/logger.dart';

class AuthRepository implements IAuthRepository {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  AuthRepository(
      {required FirebaseAuth auth,
      required GoogleSignIn googleSignIn,
      required FirebaseFirestore firestore})
      : _auth = auth,
        _googleSignIn = googleSignIn,
        _firestore = firestore;

  @override
  Stream<Option<AuthUser>> authStateChanges() async* {
    yield* _auth.authStateChanges().map(
      (user) {
        Logger().i("AuthStateChanges: ${user.toString()} ");

        if (user == null) {
          return none<AuthUser>();
        }

        final firebaseAuthUser = FirebaseAuthUser.fromUser(user);
        final authUser = firebaseAuthUser.toAuthUser();

        return some<AuthUser>(authUser);
      },
    ).onErrorReturnWith(
      (error, stackTrace) {
        if (error is FirebaseAuthException) {
          Logger().e(error.message.toString());
          return none();
        } else if (error is FirebaseException) {
          Logger().e(error.message.toString());
          return none();
        }
        Logger().e(error.toString());
        return none();
      },
    );
  }

  @override
  Future<Either<String, Unit>> verifyPhoneNumber(
    String phoneNumber, {
    void Function(PhoneAuthCredential credential)? verificationCompleted,
    void Function(FirebaseAuthException exception)? verificationFailed,
    void Function(String verificationId, int? resendToken)? codeSent,
    void Function(String verificationId)? codeAutoRetrievalTimeout,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted ?? (credential) {},
        verificationFailed: verificationFailed ?? (exception) {},
        codeSent: codeSent ?? (verificationId, resendToken) {},
        codeAutoRetrievalTimeout:
            codeAutoRetrievalTimeout ?? (String verificationId) {},
      );

      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(e.message.toString());
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(e.message.toString());
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(e.message.toString());
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> signInWithGoogle() async {
    try {
      final googleAccount = await _googleSignIn.signIn();

      if (googleAccount == null) return left("User cancelled the auth process");

      final authentication = await googleAccount.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: authentication.accessToken,
        idToken: authentication.idToken,
      );

      await _auth.signInWithCredential(credential);

      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(e.message.toString());
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> signInWithOtp({
    required String verificationId,
    required String otpCode,
  }) async {
    try {
      final phoneCredential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpCode,
      );

      await _auth.signInWithCredential(phoneCredential);

      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(e.message.toString());
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> forgotPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);

      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.message.toString());
    } on Exception catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();

      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(e.message.toString());
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
