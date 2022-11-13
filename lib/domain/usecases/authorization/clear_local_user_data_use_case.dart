import 'package:injectable/injectable.dart';
import 'package:owwn_coding_challenge/data/preferences/auth_preferences.dart';
import 'package:owwn_coding_challenge/domain/common/use_case.dart';

@injectable
class ClearLocalUserDataAndSettingsUseCase extends OutputUseCase<Future<void>> {
  final AuthPreferences _authPreferences;

  ClearLocalUserDataAndSettingsUseCase(
    this._authPreferences,
  );

  @override
  Future<void> run() async {
    await _authPreferences.clearAll();
  }
}
