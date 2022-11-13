import 'package:owwn_coding_challenge/domain/api/api_config.dart';
import 'package:owwn_coding_challenge/domain/api/base_url.dart';
import 'package:owwn_coding_challenge/injection/injector.dart';

class DomainModule {
  Future<void> inject() async {
    // Base Url API config
    injector.registerLazySingleton(() => ApiConfig(getBaseUrl()));
  }
}
