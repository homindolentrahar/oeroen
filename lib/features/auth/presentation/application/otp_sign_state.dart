import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_sign_state.freezed.dart';

@freezed
class OtpSignState with _$OtpSignState {
  const factory OtpSignState({
    String? phoneNumber,
    String? verificationId,
    String? otpCode,
  }) = _OtpSignState;
}
