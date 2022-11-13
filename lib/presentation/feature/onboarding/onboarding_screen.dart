import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/presentation/app_router.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  static ScreenRoute get route => ScreenRoute(
        name: '/onboarding',
        builder: (_) => const OnBoardingScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: const Text('app_name').tr(),
      ),
    );
  }
}
