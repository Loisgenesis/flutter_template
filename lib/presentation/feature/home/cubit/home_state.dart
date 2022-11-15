import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:owwn_coding_challenge/domain/entities/auth/user.dart';
import 'package:owwn_coding_challenge/presentation/common/bloc/base_status.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required BaseStatus firstFetchStatus,
    required List<User> users,
    required List<User> newUsers,
    required BaseStatus newStatus,
    @Default(1) int page,
  }) = _HomeState;
  const HomeState._();

  factory HomeState.initial() {
    return HomeState(
      firstFetchStatus: const BaseStatus.initial(),
      users: [],
      newUsers: [],
      newStatus: const BaseStatus.initial(),
    );
  }
}
