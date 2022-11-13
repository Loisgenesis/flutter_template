import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owwn_coding_challenge/data/services/response_errors.dart';
import 'package:owwn_coding_challenge/injection/injector.dart';
import 'package:owwn_coding_challenge/presentation/app_router.dart';
import 'package:owwn_coding_challenge/presentation/common/bloc/base_status.dart';
import 'package:owwn_coding_challenge/presentation/common/navigation/navigation_manager.dart';
import 'package:owwn_coding_challenge/presentation/feature/login/email_login_cubit.dart';
import 'package:owwn_coding_challenge/presentation/feature/onboarding/onboarding_screen.dart';
import 'package:owwn_coding_challenge/presentation/resources/resources.dart';
import 'package:owwn_coding_challenge/presentation/widgets/background_focus_scope_dismisser.dart';
import 'package:owwn_coding_challenge/presentation/widgets/loading_screen.dart';
import 'package:owwn_coding_challenge/presentation/widgets/primary_button.dart';

class EmailLoginScreen extends StatefulWidget {
  const EmailLoginScreen({Key? key}) : super(key: key);
  static ScreenRoute get route => ScreenRoute(
        name: '/email_login',
        builder: (_) => const EmailLoginScreen(),
      );

  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => injector.get<EmailLoginCubit>(),
      child: BlocListener<EmailLoginCubit, EmailLoginState>(
        listener: (context, state) {
          if (state.status.isLoading) {
            injector.get<NavigationManager>().push(
                  MaterialPageRoute(
                    builder: (_) => LoadingScreen(
                      title: 'loginLoadingTitle'.tr(),
                      subtitle: 'loginLoadingTitle'.tr(),
                    ),
                  ),
                );
          } else if (state.status.isSuccess) {
            injector.get<NavigationManager>().pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const OnBoardingScreen(),
                  ),
                  (Route<dynamic> route) => false,
                );
          } else if (state.hasFailed) {
            injector.get<NavigationManager>().pop();
          }
        },
        child: const EmailLoginWidget(),
      ),
    );
  }
}

class EmailLoginWidget extends StatefulWidget {
  const EmailLoginWidget({Key? key}) : super(key: key);

  @override
  State<EmailLoginWidget> createState() => _EmailLoginWidgetState();
}

class _EmailLoginWidgetState extends State<EmailLoginWidget> {
  final FocusNode _emailFocusNode = FocusNode();

  @override
  void dispose() {
    _emailFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((EmailLoginCubit c) => c.state);

    return BackgroundFocusScopeDismisser(
      child: Scaffold(
        appBar: AppBar(
          title: Text('login'.tr()),
          centerTitle: true,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'login'.tr(),
                      style: AppTextStyles.headline1.copyWith(
                        color: context.colors.labelPrimary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      focusNode: _emailFocusNode,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "emailLoginEmailLabel".tr(),
                        hintText: "emailLoginEmailHint".tr(),
                      ),
                      onChanged: context.read<EmailLoginCubit>().emailChanged,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 4),
                    if (state.hasFailed)
                      Text(
                        state.status.maybeWhen(
                          failure: (e) {
                            return e.getErrorMessage();
                          },
                          orElse: () => '',
                        ),
                        style: AppTextStyles.body
                            .copyWith(color: context.colors.red15),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical:
                    MediaQuery.of(context).viewInsets.bottom == 0 ? 40 : 24,
              ),
              child: PrimaryButton(
                enabled: state.canSubmit && !state.status.isLoading,
                label: 'login'.tr(),
                onPressed: context.read<EmailLoginCubit>().onLogin,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
