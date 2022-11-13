import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:owwn_coding_challenge/domain/usecases/authorization/authorization_use_case.dart';
import 'package:owwn_coding_challenge/domain/usecases/authorization/clear_local_user_data_use_case.dart';
import 'package:owwn_coding_challenge/presentation/common/bloc/base_status.dart';

part 'authorization_cubit.freezed.dart';
part 'authorization_state.dart';

@LazySingleton()
class AuthorizationCubit extends Cubit<AuthorizationState> {
  AuthorizationCubit(
    this._authorizationUseCase,
    this._clearLocalUserDataAndSettingsUseCase,
  ) : super(
          AuthorizationState.initial(),
        );

  final AuthorizationUseCase _authorizationUseCase;
  final ClearLocalUserDataAndSettingsUseCase
      _clearLocalUserDataAndSettingsUseCase;

  Future<void> _clearIfNeeded(bool wasAuthorized, bool isAuthorized) async {
    if (wasAuthorized && !isAuthorized) {
      return _clearLocalUserDataAndSettingsUseCase.run();
    }
  }

  void updateAuthorization() {
    emit(
      state.copyWith(
        status: const BaseStatus.loading(),
      ),
    );
    final isAuthorized = _authorizationUseCase.run();
    _clearIfNeeded(state.isAuthorized, isAuthorized);
    emit(
      state.copyWith(
        isAuthorized: isAuthorized,
        status: const BaseStatus.success(),
      ),
    );
  }
}
