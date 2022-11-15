import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owwn_coding_challenge/injection/injector.dart';
import 'package:owwn_coding_challenge/presentation/app_router.dart';
import 'package:owwn_coding_challenge/presentation/common/bloc/authorization_cubit.dart';
import 'package:owwn_coding_challenge/presentation/common/bloc/base_status.dart';
import 'package:owwn_coding_challenge/presentation/common/navigation/navigation_manager.dart';
import 'package:owwn_coding_challenge/presentation/feature/home/home_screen.dart';
import 'package:owwn_coding_challenge/presentation/feature/login/email_login_screen.dart';
import 'package:owwn_coding_challenge/presentation/resources/resources.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => injector.get<AuthorizationCubit>(),
        ),
      ],
      child: BlocListener<AuthorizationCubit, AuthorizationState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: (context, state) {
          if (state.status.isSuccess) {
            _navigateToPage();
          }
        },
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
      ),
    );
  }

  void _navigateToPage() {
    final navigationManager = injector.get<NavigationManager>();
    final authCubit = injector.get<AuthorizationCubit>();

    final isAuthorized = authCubit.state.isAuthorized;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isAuthorized) {
        navigationManager.pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const EmailLoginScreen(),
          ),
          (Route<dynamic> route) => false,
        );
      } else {
        navigationManager.pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (Route<dynamic> route) => false,
        );
      }
    });
  }
}
