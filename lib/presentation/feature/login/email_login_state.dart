part of 'email_login_cubit.dart';

@freezed
class EmailLoginState with _$EmailLoginState {

  factory EmailLoginState({
    required Email email,
    required BaseStatus status,
  }) = _EmailLoginState;
  const EmailLoginState._();

  factory EmailLoginState.initial() {
    return EmailLoginState(
      email: const Email.pure(),
      status: const BaseStatus.initial(),
    );
  }

  bool get canSubmit => email.valid;

  bool get hasFailed => status.isFailure || status.isExceptionFailure;
}
