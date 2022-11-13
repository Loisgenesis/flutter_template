import 'package:injectable/injectable.dart';
import 'package:owwn_coding_challenge/data/model/auth/auth_tokens.dart';
import 'package:owwn_coding_challenge/data/preferences/auth_preferences.dart';
import 'package:owwn_coding_challenge/data/repositories/auth/source/auth_repository.dart';
import 'package:owwn_coding_challenge/domain/common/use_case.dart';
import 'package:owwn_coding_challenge/domain/entities/requests/email_request_model.dart';

@injectable
class EmailLoginUseCase extends UseCase<EmailRequestModel, Future<void>> {
  final AuthRepository _authRepository;
  final AuthPreferences _authPreferences;

  EmailLoginUseCase(
    this._authRepository,
    this._authPreferences,
  );

  @override
  Future<void> run(EmailRequestModel input) {
    return _authRepository.emailPasswordLogin(input).then(
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
