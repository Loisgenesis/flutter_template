import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:owwn_coding_challenge/data/services/response_errors.dart';
import 'package:owwn_coding_challenge/domain/entities/auth/user.dart';
import 'package:owwn_coding_challenge/injection/injector.dart';
import 'package:owwn_coding_challenge/presentation/app_router.dart';
import 'package:owwn_coding_challenge/presentation/common/bloc/base_status.dart';
import 'package:owwn_coding_challenge/presentation/common/navigation/navigation_manager.dart';
import 'package:owwn_coding_challenge/presentation/feature/home/cubit/home_cubit.dart';
import 'package:owwn_coding_challenge/presentation/feature/home/cubit/home_state.dart';
import 'package:owwn_coding_challenge/presentation/feature/home/user_item.dart';
import 'package:owwn_coding_challenge/presentation/feature/login/email_login_screen.dart';
import 'package:owwn_coding_challenge/presentation/resources/resources.dart';
import 'package:owwn_coding_challenge/presentation/widgets/app_state/error_app_state.dart';
import 'package:owwn_coding_challenge/presentation/widgets/app_state/loading_app_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static ScreenRoute get route => ScreenRoute(
        name: '/home',
        builder: (_) => const HomeScreen(),
      );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeCubit = injector.get<HomeCubit>();

  @override
  void initState() {
    super.initState();
    _homeCubit.load(limit: 50, page: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: _homeCubit,
        builder: (context, state) {
          if (state.status.isSubmitted) {
            _navigateToPage();
          }
          return state.status.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => LoadingAppState(
              title: 'loading'.tr(),
              subtitle: 'loginLoadingSubTitle'.tr(),
            ),
            failure: (e) => ErrorAppState(
              title: e.getErrorMessage(),
              subtitle: 'tryAgain'.tr(),
              onTap: () {
                _homeCubit.load(limit: 50, page: 1);
              },
            ),
            success: () => CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 300,
                  pinned: true,
                  centerTitle: true,
                  backgroundColor: Colors.black,
                  flexibleSpace: FlexibleSpaceBar(
                    title: const Text('Users'),
                    background: Image.asset(
                      AppImages.usersBackground,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    GroupedListView<User, String>(
                      shrinkWrap: true,
                      elements: state.users,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      groupBy: (User user) => user.status.toUpperCase(),
                      groupSeparatorBuilder: (value) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          value.toUpperCase(),
                          style: AppTextStyles.headline2,
                        ),
                      ),
                      separator: const SizedBox(height: 12),
                      itemBuilder: (context, User user) {
                        return UserCard(
                          userDetails: user,
                        );
                      },
                    ),
                  ]),
                ),
                const SliverPadding(padding: EdgeInsets.all(20))
              ],
            ),
          );
        },
      ),
    );
  }

  void _navigateToPage() {
    final navigationManager = injector.get<NavigationManager>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigationManager.pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const EmailLoginScreen(),
        ),
        (Route<dynamic> route) => false,
      );
    });
  }
}
