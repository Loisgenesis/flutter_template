import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owwn_coding_challenge/injection/injector.dart';
import 'package:owwn_coding_challenge/presentation/app_router.dart';
import 'package:owwn_coding_challenge/presentation/common/bloc/authorization_cubit.dart';
import 'package:owwn_coding_challenge/presentation/common/navigation/navigation_manager.dart';
import 'package:owwn_coding_challenge/presentation/resources/resources.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => injector.get<AuthorizationCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'OWWN Coding Challenge',
        debugShowCheckedModeBanner: false,
        navigatorKey: injector.get<NavigationManager>().navigatorKey,
        theme: getAppTheme(Brightness.dark),
        darkTheme: getAppTheme(Brightness.dark),
        onGenerateRoute: AppRouter().onGenerateRoute,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
