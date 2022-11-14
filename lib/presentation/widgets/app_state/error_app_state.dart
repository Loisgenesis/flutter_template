import 'package:flutter/material.dart';
import 'package:owwn_coding_challenge/presentation/resources/resources.dart';
import 'package:owwn_coding_challenge/presentation/widgets/primary_button.dart';

class ErrorAppState extends StatelessWidget {
  const ErrorAppState({
    Key? key,
    required this.title,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 97, right: 97),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style:
                        AppTextStyles.headline2.copyWith(color: colors.white),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body.copyWith(
                      color: colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (onTap != null) ...[
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 48, right: 48),
            child: PrimaryButton(
              label: 'retry',
              onPressed: onTap!,
            ),
          ),
        ]
      ],
    );
  }
}
