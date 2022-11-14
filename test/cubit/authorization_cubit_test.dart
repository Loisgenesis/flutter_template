import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:owwn_coding_challenge/domain/usecases/authorization/authorization_use_case.dart';
import 'package:owwn_coding_challenge/domain/usecases/authorization/clear_local_user_data_use_case.dart';
import 'package:owwn_coding_challenge/presentation/common/bloc/authorization_cubit.dart';
import 'package:owwn_coding_challenge/presentation/common/bloc/base_status.dart';

class MockAuthorizationUseCase extends Mock implements AuthorizationUseCase {}

class MockClearLocalUserDataAndSettingsUseCase extends Mock
    implements ClearLocalUserDataAndSettingsUseCase {}

void main() {
  late MockAuthorizationUseCase mockAuthorizationUseCase;
  late MockClearLocalUserDataAndSettingsUseCase
      mockClearLocalUserDataAndSettingsUseCase;

  AuthorizationCubit cubit() => AuthorizationCubit(
        mockAuthorizationUseCase,
        mockClearLocalUserDataAndSettingsUseCase,
      );

  setUp(() {
    mockAuthorizationUseCase = MockAuthorizationUseCase();
    mockClearLocalUserDataAndSettingsUseCase =
        MockClearLocalUserDataAndSettingsUseCase();
  });

  group(
    'AuthorizationCubit',
    () {
      blocTest<AuthorizationCubit, AuthorizationState>(
        'emits initial state',
        build: cubit,
        verify: (cubit) => expect(
          cubit.state,
          equals(
            AuthorizationState.initial(),
          ),
        ),
      );

      group(
        'when updateAuthorization called',
        () {
          blocTest<AuthorizationCubit, AuthorizationState>(
            'emits [isAuthorized == true] when user is authorized',
            build: cubit,
            setUp: () {
              when(
                () => mockAuthorizationUseCase.run(),
              ).thenReturn(true);
            },
            act: (cubit) => cubit.updateAuthorization(),
            expect: () => [
              AuthorizationState.initial().copyWith(
                status: const BaseStatus.loading(),
                isAuthorized: false,
              ),
              AuthorizationState.initial().copyWith(
                status: const BaseStatus.success(),
                isAuthorized: true,
              ),
            ],
          );

          blocTest<AuthorizationCubit, AuthorizationState>(
            'emits [isAuthorized == false] when user is not authorized',
            build: cubit,
            setUp: () {
              when(
                () => mockAuthorizationUseCase.run(),
              ).thenReturn(false);
            },
            act: (cubit) => cubit.updateAuthorization(),
            expect: () => [
              AuthorizationState.initial().copyWith(
                status: const BaseStatus.loading(),
                isAuthorized: false,
              ),
              AuthorizationState.initial().copyWith(
                status: const BaseStatus.success(),
                isAuthorized: false,
              ),
            ],
          );

          blocTest<AuthorizationCubit, AuthorizationState>(
            'calls clear local user data when getting unauthorized',
            build: cubit,
            seed: () => AuthorizationState.initial().copyWith(
              status: const BaseStatus.success(),
              isAuthorized: true,
            ),
            setUp: () {
              when(
                () => mockAuthorizationUseCase.run(),
              ).thenReturn(false);
              when(
                () => mockClearLocalUserDataAndSettingsUseCase.run(),
              ).thenAnswer((_) async {});
            },
            act: (cubit) => cubit.updateAuthorization(),
            verify: (cubit) {
              verify(() => mockClearLocalUserDataAndSettingsUseCase.run())
                  .called(1);
            },
          );

          blocTest<AuthorizationCubit, AuthorizationState>(
            'should not call clear local data when [isAuthorized == true] is not changed',
            build: cubit,
            seed: () => AuthorizationState.initial().copyWith(
              status: const BaseStatus.success(),
              isAuthorized: true,
            ),
            setUp: () {
              when(
                () => mockAuthorizationUseCase.run(),
              ).thenReturn(true);
            },
            act: (cubit) => cubit.updateAuthorization(),
            verify: (cubit) {
              verifyNever(
                () => mockClearLocalUserDataAndSettingsUseCase.run(),
              );
            },
          );

          blocTest<AuthorizationCubit, AuthorizationState>(
            'should not call clear local data when [isAuthorized == false] and is not changed',
            build: cubit,
            seed: () => AuthorizationState.initial().copyWith(
              status: const BaseStatus.success(),
              isAuthorized: false,
            ),
            setUp: () {
              when(
                () => mockAuthorizationUseCase.run(),
              ).thenReturn(false);
            },
            act: (cubit) => cubit.updateAuthorization(),
            verify: (cubit) {
              verifyNever(
                () => mockClearLocalUserDataAndSettingsUseCase.run(),
              );
            },
          );
        },
      );
    },
  );
}
