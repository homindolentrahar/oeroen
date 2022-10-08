import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:oeroen/features/auth/domain/usecases/create_user_with_email_and_password.dart';
import 'package:oeroen/features/auth/domain/usecases/sign_in_with_email_and_password.dart';
import 'package:oeroen/features/auth/domain/usecases/sign_in_with_google.dart';

class UserSignController extends GetxController with StateMixin<Unit> {
  final SignInWithEmailAndPassword _signInWithEmailAndPassword;
  final SignInWithGoogle _signInWithGoogle;
  final CreateUserWithEmailAndPassword _createUserWithEmailAndPassword;

  UserSignController({
    required SignInWithEmailAndPassword signInWithEmailAndPassword,
    required SignInWithGoogle signInWithGoogle,
    required CreateUserWithEmailAndPassword createUserWithEmailAndPassword,
  })  : _signInWithEmailAndPassword = signInWithEmailAndPassword,
        _signInWithGoogle = signInWithGoogle,
        _createUserWithEmailAndPassword = createUserWithEmailAndPassword;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    change(null, status: RxStatus.loading());

    final result = await _signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    result.fold(
      (error) {
        change(null, status: RxStatus.error(error));
      },
      (unit) {
        change(unit, status: RxStatus.success());
      },
    );
  }

  Future<void> googleLogin() async {
    change(null, status: RxStatus.loading());

    final result = await _signInWithGoogle();

    result.fold(
      (error) {
        change(null, status: RxStatus.error(error));
      },
      (unit) {
        change(unit, status: RxStatus.success());
      },
    );
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    change(null, status: RxStatus.loading());

    final result = await _createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    result.fold(
      (error) {
        change(null, status: RxStatus.error(error));
      },
      (unit) {
        change(unit, status: RxStatus.success());
      },
    );
  }
}
