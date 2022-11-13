// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required String access_token,
    required String refresh_token,
  }) = _LoginResponse;

  @visibleForTesting
  factory LoginResponse.mock() {
    return const LoginResponse(
      access_token: 'a',
      refresh_token: 'b',
    );
  }

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
