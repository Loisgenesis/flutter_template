import 'package:owwn_coding_challenge/domain/entities/auth/login_response.dart';
import 'package:owwn_coding_challenge/domain/entities/requests/email_request_model.dart';
import 'package:owwn_coding_challenge/domain/entities/responses/user/get_users_response.dart';

abstract class UserRepository {
  Future<LoginResponse> emailPasswordLogin(
    EmailRequestModel input,
  );

  Future<GetUsersResponse> getListOfUsers();
}
