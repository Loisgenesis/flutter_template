import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:owwn_coding_challenge/data/services/response_errors.dart';
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

  Future<void> load() async {
    if (state.firstFetchStatus.isLoading) return;
    emit(
      state.copyWith(
        firstFetchStatus: const BaseStatus.loading(),
      ),
    );
    try {
      await getUsersCase.run(state.page).then((value) {
        if (value.users.isNotEmpty) {
          emit(
            state.copyWith(
              page: state.page + 1,
            ),
          );
        }
        emit(
          state.copyWith(
            firstFetchStatus: const BaseStatus.success(),
            users: value.users,
          ),
        );
      });
    } catch (e) {
      if (e == const ResponseErrors.unauthorized()) {
        emit(
          state.copyWith(firstFetchStatus: const BaseStatus.submitted()),
        );
      } else {
        emit(
          state.copyWith(
            firstFetchStatus:
                BaseStatus.failure(ResponseErrors.fromDioError(e)),
          ),
        );
      }
    }
  }

  Future<void> fetchNewUsers() async {
    if (state.newStatus.isLoading) return;

    emit(
      state.copyWith(
        newStatus: const BaseStatus.loading(),
      ),
    );

    try {
      await getUsersCase.run(state.page).then((result) {
        if (result.users.isNotEmpty) {
          emit(
            state.copyWith(
              page: state.page + 1,
              newUsers: result.users,
              newStatus: const BaseStatus.success(),
            ),
          );
        } else if (result.users.isEmpty) {
          emit(
            state.copyWith(
              page: state.page,
              newUsers: [],
              newStatus: const BaseStatus.empty(),
            ),
          );
        }
      });
    } catch (e) {
      if (e == const ResponseErrors.unauthorized()) {
        emit(
          state.copyWith(newStatus: const BaseStatus.submitted()),
        );
      } else {
        emit(
          state.copyWith(
            newStatus: BaseStatus.failure(ResponseErrors.fromDioError(e)),
          ),
        );
      }
    }
  }
}
