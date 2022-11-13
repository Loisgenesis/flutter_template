import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required String token,
    required String refreshToken,
  }) = _LoginResponse;

  @visibleForTesting
  factory LoginResponse.mock() {
    return const LoginResponse(
      token: 'a',
      refreshToken: 'b',
    );
  }

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
