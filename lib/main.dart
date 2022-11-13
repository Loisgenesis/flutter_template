import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:owwn_coding_challenge/app.dart';
import 'package:owwn_coding_challenge/injection/dependencies.dart';
import 'package:owwn_coding_challenge/presentation/common/language/language_manager.dart';
import 'package:owwn_coding_challenge/presentation/resources/resources.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await DependencyManager().inject();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]).then(
    (_) => runApp(
      EasyLocalization(
        supportedLocales: LanguageManager.instance!.supportedLocales,
        path: AppConstants.languageAssetsPath,
        startLocale: LanguageManager.instance!.enLocale,
        child: const App(),
      ),
    ),
  );
}
