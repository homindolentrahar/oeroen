import 'package:get/get.dart';
import 'package:oeroen/features/auth/domain/usecases/auth_state_changes.dart';
import 'package:oeroen/features/auth/domain/usecases/sign_out.dart';
import 'package:oeroen/features/auth/presentation/application/auth_state.dart';
import 'package:rxdart/rxdart.dart';

class AuthController extends GetxController with StateMixin<AuthState> {
  final AuthStateChanges _authStateChanges;
  final SignOut _signOut;

  AuthController({
    required AuthStateChanges authStateChanges,
    required SignOut signOut,
  })  : _authStateChanges = authStateChanges,
        _signOut = signOut {
    _authStateChanges().doOnListen(() {
      change(const AuthState.loading(), status: RxStatus.loading());
    }).listen(
      (either) {
        either.fold(
          (error) {
            change(
              const AuthState.unauthenticated(),
              status: RxStatus.error(error),
            );
          },
          (authUser) {
            change(
              AuthState.authenticated(authUser),
              status: RxStatus.success(),
            );
          },
        );
      },
    );
  }

  Future<void> signOut() async {
    change(null, status: RxStatus.loading());

    final result = await _signOut();

    result.fold(
      (error) {
        change(state, status: RxStatus.error(error));
      },
      (_) {
        change(const AuthState.unauthenticated(), status: RxStatus.success());
      },
    );
  }
}
