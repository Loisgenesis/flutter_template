import 'package:owwn_coding_challenge/domain/entities/responses/user/get_users_response.dart';

abstract class UserRepository {
  Future<GetUsersResponse> getListOfUsers();
}
