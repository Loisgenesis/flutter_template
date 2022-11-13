import 'package:injectable/injectable.dart';
import 'package:owwn_coding_challenge/data/model/auth/auth_tokens.dart';
import 'package:owwn_coding_challenge/data/preferences/auth_preferences.dart';
import 'package:owwn_coding_challenge/data/repositories/user/user_repository.dart';
import 'package:owwn_coding_challenge/domain/common/use_case.dart';
import 'package:owwn_coding_challenge/domain/entities/requests/email_request_model.dart';

@injectable
class EmailLoginUseCase extends UseCase<EmailRequestModel, Future<void>> {
  final UserRepository _userRepository;
  final AuthPreferences _authPreferences;

  EmailLoginUseCase(
    this._userRepository,
    this._authPreferences,
  );

  @override
  Future<void> run(EmailRequestModel input) {
    return _userRepository.emailPasswordLogin(input).then(
      (response) async {
        final tokens = AuthTokens(
          accessToken: response.access_token,
          refreshToken: response.refresh_token,
        );
        await _authPreferences.setAuthTokens(tokens);
      },
    );
  }
}
