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

class StartUpScreen extends StatefulWidget {
  const StartUpScreen({Key? key}) : super(key: key);

  static ScreenRoute get route => ScreenRoute(
        name: '/',
        builder: (_) => const StartUpScreen(),
      );

  @override
  State<StartUpScreen> createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen> {
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
            builder: (context) => const HomeScreen(),
          ),
          (Route<dynamic> route) => false,
        );
      }
    });
  }
}
