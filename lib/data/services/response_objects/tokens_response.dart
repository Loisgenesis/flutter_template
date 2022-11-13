import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owwn_coding_challenge/data/model/auth/auth_tokens.dart';

part 'tokens_response.freezed.dart';
part 'tokens_response.g.dart';

// ignore: non_constant_identifier_names
@freezed
class TokensResponse with _$TokensResponse {
  const factory TokensResponse({
    required String accessToken,
    required String refreshToken,
  }) = _TokensResponse;
  const TokensResponse._();

  @visibleForTesting
  factory TokensResponse.mock() {
    return const TokensResponse(
      accessToken: 'a',
      refreshToken: 'b',
    );
  }

  factory TokensResponse.fromJson(Map<String, dynamic> json) =>
      _$TokensResponseFromJson(json);

  AuthTokens getEntity() {
    return AuthTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
