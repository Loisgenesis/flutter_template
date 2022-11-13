import 'package:injectable/injectable.dart';
import 'package:owwn_coding_challenge/data/model/auth/auth_tokens.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// This class handles the authentication state of the whole app.
@Injectable()
class AuthPreferences {
  AuthPreferences(this._preferences);

  static const String prefix = 'auth';
  static const String _accessTokenKey = '${prefix}_access_token_key';
  static const String _refreshTokenKey = '${prefix}_refresh_token_key';

  final SharedPreferences _preferences;

  /// Returns whether there is a valid auth session available or not.
  /// We do this by checking if we have a valid auth token.
  bool isLoggedIn() {
    return accessToken != null;
  }

  String? get accessToken => _preferences.getString(_accessTokenKey);

  bool get hasValidAccessToken => accessToken != null;

  String? get refreshToken => _preferences.getString(_refreshTokenKey);

  bool get hasValidRefreshToken => refreshToken != null;

  Future setAccessToken(String token) {
    return _preferences.setString(_accessTokenKey, token);
  }

  Future setRefreshToken(String token) {
    return _preferences.setString(_refreshTokenKey, token);
  }

  Future setAuthTokens(AuthTokens authTokens) async {
    await setAccessToken(authTokens.accessToken);
    await setRefreshToken(authTokens.refreshToken);
  }

  Future<void> clearAll() async {
    await _preferences.remove(_accessTokenKey);
    await _preferences.remove(_refreshTokenKey);
  }
}
