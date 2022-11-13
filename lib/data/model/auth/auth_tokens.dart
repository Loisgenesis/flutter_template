import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_tokens.freezed.dart';

@freezed
class AuthTokens with _$AuthTokens {
  const factory AuthTokens({
    required String accessToken,
    required String refreshToken,
  }) = _AuthTokens;
  const AuthTokens._();

  @visibleForTesting
  factory AuthTokens.mock() {
    return const AuthTokens(
      accessToken: 'a',
      refreshToken: 'b',
    );
  }

  bool get hasValidAccessToken => accessToken.isNotEmpty;

  bool get hasValidRefreshToken => refreshToken.isNotEmpty;
}
