import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owwn_coding_challenge/data/services/response_errors.dart';
import 'package:owwn_coding_challenge/injection/injector.dart';
import 'package:owwn_coding_challenge/presentation/app_router.dart';
import 'package:owwn_coding_challenge/presentation/common/bloc/base_status.dart';
import 'package:owwn_coding_challenge/presentation/common/navigation/navigation_manager.dart';
import 'package:owwn_coding_challenge/presentation/feature/home/cubit/home_cubit.dart';
import 'package:owwn_coding_challenge/presentation/feature/home/cubit/home_state.dart';
import 'package:owwn_coding_challenge/presentation/feature/home/user_list_widget.dart';
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
  final ScrollController _scrollController = ScrollController();
  final newUsersWidgets = <Widget>[];
  @override
  void initState() {
    super.initState();
    _homeCubit.load();
    setupScrollController();
  }

  void setupScrollController() {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          _homeCubit.fetchNewUsers();
        }
      }
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: _homeCubit,
        builder: (context, state) {
          if (state.newStatus.isSuccess) {
            newUsersWidgets.add(
              UserListWidget(
                users: state.newUsers,
              ),
            );
          }

          if (state.firstFetchStatus.isSubmitted ||
              state.newStatus.isSubmitted) {
            _navigateToPage();
          }
          return state.firstFetchStatus.maybeWhen(
            orElse: () => const SizedBox.shrink(),
            loading: () => LoadingAppState(
              title: 'loading'.tr(),
              subtitle: 'loginLoadingSubTitle'.tr(),
            ),
            failure: (e) => ErrorAppState(
              title: e.getErrorMessage(),
              subtitle: 'tryAgain'.tr(),
              onTap: () {
                _homeCubit.load();
              },
            ),
            success: () => CustomScrollView(
              controller: _scrollController,
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
                    UserListWidget(users: state.users),
                    ...newUsersWidgets,
                  ]),
                ),
                const SliverPadding(padding: EdgeInsets.all(10)),
                SliverToBoxAdapter(
                  child: state.newStatus.maybeWhen(
                    orElse: () => const SizedBox.shrink(),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    failure: (e) => Center(
                      child: Text(
                        e.getErrorMessage(),
                      ),
                    ),
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.all(10))
              ],
            ),
          );
        },
      ),
    );
  }
}
