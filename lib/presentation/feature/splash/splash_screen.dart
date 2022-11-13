import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owwn_coding_challenge/injection/injector.dart';
import 'package:owwn_coding_challenge/presentation/app_router.dart';
import 'package:owwn_coding_challenge/presentation/common/bloc/authorization_cubit.dart';
import 'package:owwn_coding_challenge/presentation/common/bloc/base_status.dart';
import 'package:owwn_coding_challenge/presentation/common/navigation/navigation_manager.dart';
import 'package:owwn_coding_challenge/presentation/feature/login/email_login_screen.dart';
import 'package:owwn_coding_challenge/presentation/feature/onboarding/onboarding_screen.dart';
import 'package:owwn_coding_challenge/presentation/resources/resources.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static ScreenRoute get route => ScreenRoute(
        name: '/',
        builder: (_) => const SplashScreen(),
      );

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    injector.get<AuthorizationCubit>().updateAuthorization();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthorizationCubit, AuthorizationState>(
        builder: (context, state) {
          if (state.status.isSuccess) {
            _navigateToPage();
          }
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppImages.loadingScreenBackground,
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
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
            builder: (context) => const OnBoardingScreen(),
          ),
          (Route<dynamic> route) => false,
        );
      }
    });
  }
}
