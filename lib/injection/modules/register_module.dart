import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Registering third party types

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
