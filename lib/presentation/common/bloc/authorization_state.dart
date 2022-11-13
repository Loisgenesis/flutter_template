part of 'authorization_cubit.dart';

@freezed
class AuthorizationState with _$AuthorizationState {

  factory AuthorizationState({
    required BaseStatus status,
    required bool isAuthorized,
  }) = _AuthorizationState;
  const AuthorizationState._();

  factory AuthorizationState.initial() {
    return AuthorizationState(
      isAuthorized: false,
      status: const BaseStatus.loading(),
    );
  }
}
