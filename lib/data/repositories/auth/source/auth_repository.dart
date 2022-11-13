import 'package:owwn_coding_challenge/domain/entities/auth/login_response.dart';
import 'package:owwn_coding_challenge/domain/entities/requests/email_request_model.dart';

abstract class AuthRepository {
  Future<LoginResponse> emailPasswordLogin(
    EmailRequestModel input,
  );

}
