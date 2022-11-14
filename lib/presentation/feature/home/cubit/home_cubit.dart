import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:owwn_coding_challenge/data/services/response_errors.dart';
import 'package:owwn_coding_challenge/domain/entities/requests/get_user_request_model.dart';
import 'package:owwn_coding_challenge/domain/usecases/user/get_users_usecase.dart';
import 'package:owwn_coding_challenge/presentation/common/bloc/base_status.dart';
import 'package:owwn_coding_challenge/presentation/feature/home/cubit/home_state.dart';

@Injectable()
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this.getUsersCase, {
    @factoryParam HomeState? state,
  }) : super(state ?? HomeState.initial());

  final GetUsersCase getUsersCase;

  Future<void> load({required int limit, required int page}) async {
    if (state.status.isLoading) return;

    emit(
      state.copyWith(
        status: const BaseStatus.loading(),
      ),
    );

    try {
      final value = await getUsersCase
          .run(GetUserRequestModel.createModel(limit: limit, page: page));
      emit(
        state.copyWith(status: const BaseStatus.success(), users: value.users),
      );
    } catch (e) {
      if (e == const ResponseErrors.unauthorized()) {
        emit(
          state.copyWith(users: [], status: const BaseStatus.submitted()),
        );
      } else {
        emit(
          state.copyWith(
            users: [],
            status: BaseStatus.failure(ResponseErrors.fromDioError(e)),
          ),
        );
      }
    }
  }
}
