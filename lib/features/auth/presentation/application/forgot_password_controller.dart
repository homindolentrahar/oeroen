import 'package:get/get.dart';
import 'package:oeroen/features/auth/domain/usecases/forgot_password.dart';

class ForgotPasswordController extends GetxController with StateMixin<String> {
  final ForgotPassword _forgotPassword;

  ForgotPasswordController({
    required ForgotPassword forgotPassword,
  }) : _forgotPassword = forgotPassword;

  Future<void> forgotPassword(String email) async {
    change(null, status: RxStatus.loading());

    final result = await _forgotPassword(email);

    result.fold(
      (error) {
        change(null, status: RxStatus.error(error));
      },
      (_) {
        change(email, status: RxStatus.success());
      },
    );
  }
}
