import 'package:owwn_coding_challenge/injection/injector.dart';
import 'package:owwn_coding_challenge/injection/modules/data_module.dart';
import 'package:owwn_coding_challenge/injection/modules/domain_module.dart';
import 'package:owwn_coding_challenge/injection/modules/network_module.dart';

class DependencyManager {
  Future<void> inject() async {
    // App modules
    await DataModule().inject();
    await NetworkModule().inject();
    await DomainModule().inject();

    // Injectable
    await configureDependencies();
  }
}
