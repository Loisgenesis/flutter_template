import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owwn_coding_challenge/domain/entities/auth/user.dart';

part 'get_users_response.freezed.dart';
part 'get_users_response.g.dart';

@freezed
class GetUsersResponse with _$GetUsersResponse {
  const factory GetUsersResponse({
    required List<User> users,
  }) = _GetUsersResponse;

  factory GetUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUsersResponseFromJson(json);

  @visibleForTesting
  factory GetUsersResponse.mock() => const GetUsersResponse(
        users: [],
      );
}
