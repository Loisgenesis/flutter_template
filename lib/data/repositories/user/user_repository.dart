import 'package:owwn_coding_challenge/domain/entities/requests/get_user_request_model.dart';
import 'package:owwn_coding_challenge/domain/entities/responses/user/get_users_response.dart';

abstract class UserRepository {
  Future<GetUsersResponse> getListOfUsers(int page);
}
