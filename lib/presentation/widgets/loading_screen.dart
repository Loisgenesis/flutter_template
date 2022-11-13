import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/presentation/resources/resources.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({
    Key? key,
    required this.title,
    required this.subtitle,
    this.onWillPop,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Future<bool> Function()? onWillPop;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Image.asset(
                AppImages.loadingScreenBackground,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const _LoaderWidget(),
                  Container(
                    constraints: const BoxConstraints(maxHeight: 57),
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Text(
                    title.toUpperCase(),
                    style: AppTextStyles.headline3.copyWith(
                      color: context.colors.labelPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: AppTextStyles.body1.copyWith(
                      color: context.colors.labelPrimary.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoaderWidget extends StatelessWidget {
  const _LoaderWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 194,
      width: 194,
      child: CircularProgressIndicator(
        value: 0.6,
        strokeWidth: 3,
        color: context.colors.tintGreen2,
      ),
    );
  }
}
