import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:owwn_coding_challenge/data/services/response_errors.dart';
import 'package:owwn_coding_challenge/domain/entities/requests/get_user_request_model.dart';
import 'package:owwn_coding_challenge/domain/entities/responses/user/get_users_response.dart';
import 'package:owwn_coding_challenge/domain/usecases/user/get_users_usecase.dart';
import 'package:owwn_coding_challenge/presentation/common/bloc/base_status.dart';
import 'package:owwn_coding_challenge/presentation/feature/home/cubit/home_cubit.dart';
import 'package:owwn_coding_challenge/presentation/feature/home/cubit/home_state.dart';

class MockGetUsersCase extends Mock implements GetUsersCase {}

void main() {
  late final MockGetUsersCase mockGetUsersCase;

  setUpAll(() {
    mockGetUsersCase = MockGetUsersCase();
    registerFallbackValue(GetUsersResponse.mock());
    registerFallbackValue(GetUserRequestModel.mock());
  });

  group('HomeCubit', () {
    blocTest<HomeCubit, HomeState>(
      'emits [loading, success] when get user succeeds',
      build: () {
        when(
          () => mockGetUsersCase.run(GetUserRequestModel.mock()),
        ).thenAnswer(
          (_) async => GetUsersResponse.mock(),
        );
        return HomeCubit(mockGetUsersCase);
      },
      act: (cubit) => cubit.load(limit:GetUserRequestModel.mock().limit,page: GetUserRequestModel.mock().page),
      expect: () => [
        HomeState.initial().copyWith(
          status: const BaseStatus.loading(),
          users: [],
        ),
        HomeState.initial().copyWith(
          status: const BaseStatus.success(),
          users: [],
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits [loading, failure] when get user fails',
      build: () {
        when(
          () => mockGetUsersCase.run(GetUserRequestModel.mock()),
        ).thenAnswer(
          (_) async => throw const ResponseErrors.unexpectedError(),
        );
        return HomeCubit(mockGetUsersCase);
      },
      act: (cubit) =>  cubit.load(limit:GetUserRequestModel.mock().limit,page: GetUserRequestModel.mock().page),
      expect: () => [
        HomeState.initial().copyWith(
          status: const BaseStatus.loading(),
          users: [],
        ),
        HomeState.initial().copyWith(
          status: const BaseStatus.failure(
            ResponseErrors.unexpectedError(),
          ),
          users: [],
        ),
      ],
    );
  });
}
