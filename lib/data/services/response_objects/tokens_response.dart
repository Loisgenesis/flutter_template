// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owwn_coding_challenge/data/model/auth/auth_tokens.dart';

part 'tokens_response.freezed.dart';
part 'tokens_response.g.dart';

@freezed
class TokensResponse with _$TokensResponse {
  const factory TokensResponse({
    required String access_token,
    required String refresh_token,
  }) = _TokensResponse;
  const TokensResponse._();

  @visibleForTesting
  factory TokensResponse.mock() {
    return const TokensResponse(
      access_token: 'a',
      refresh_token: 'b',
    );
  }

  factory TokensResponse.fromJson(Map<String, dynamic> json) =>
      _$TokensResponseFromJson(json);

  AuthTokens getEntity() {
    return AuthTokens(
      accessToken: access_token,
      refreshToken: refresh_token,
    );
  }
}
