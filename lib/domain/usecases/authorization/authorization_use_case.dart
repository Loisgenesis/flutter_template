import 'package:injectable/injectable.dart';
import 'package:owwn_coding_challenge/data/preferences/auth_preferences.dart';
import 'package:owwn_coding_challenge/domain/common/use_case.dart';

@injectable
class AuthorizationUseCase extends OutputUseCase<bool> {
  final AuthPreferences _authPreferences;

  AuthorizationUseCase(
    this._authPreferences,
  );

  @override
  bool run() {
    final isAuthorized = _authPreferences.hasValidAccessToken;
    return isAuthorized;
  }
}
