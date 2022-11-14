import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:owwn_coding_challenge/data/services/response_errors.dart';
import 'package:owwn_coding_challenge/domain/entities/auth/login_response.dart';
import 'package:owwn_coding_challenge/domain/entities/requests/email_request_model.dart';
import 'package:owwn_coding_challenge/domain/usecases/login/email_login_use_case.dart';
import 'package:owwn_coding_challenge/domain/validation/email.dart';
import 'package:owwn_coding_challenge/presentation/common/bloc/base_status.dart';
import 'package:owwn_coding_challenge/presentation/feature/login/cubit/email_login_cubit.dart';

class MockEmailLoginUseCase extends Mock implements EmailLoginUseCase {}

void main() {
  late final MockEmailLoginUseCase mockEmailLoginUseCase;

  setUpAll(() {
    mockEmailLoginUseCase = MockEmailLoginUseCase();
    registerFallbackValue(
      EmailRequestModel.mock(),
    );
  });

  group('EmaiLoginCubit', () {
    const tEmail = Email.dirty(value: 'test@test.com');

    blocTest<EmailLoginCubit, EmailLoginState>(
      'emits initial state',
      build: () {
        return EmailLoginCubit(mockEmailLoginUseCase);
      },
      verify: (cubit) => expect(
        cubit.state,
        equals(
          EmailLoginState.initial(),
        ),
      ),
    );

    blocTest<EmailLoginCubit, EmailLoginState>(
      'emits state with new email',
      build: () {
        return EmailLoginCubit(mockEmailLoginUseCase);
      },
      act: (cubit) => cubit.emailChanged(tEmail.value),
      verify: (cubit) => expect(
        cubit.state,
        equals(
          cubit.state.copyWith(
            email: tEmail,
          ),
        ),
      ),
    );

    blocTest<EmailLoginCubit, EmailLoginState>(
      'emits [loading, success] when login succeeds',
      build: () {
        when(
          () => mockEmailLoginUseCase.run(any()),
        ).thenAnswer(
          (_) async => LoginResponse.mock(),
        );
        return EmailLoginCubit(mockEmailLoginUseCase);
      },
      act: (cubit) => cubit.onLogin(),
      expect: () => [
        EmailLoginState.initial().copyWith(
          status: const BaseStatus.loading(),
        ),
        EmailLoginState.initial().copyWith(
          status: const BaseStatus.success(),
        ),
      ],
    );

    blocTest<EmailLoginCubit, EmailLoginState>(
      'emits [loading, failure] when login fails',
      build: () {
        when(
          () => mockEmailLoginUseCase.run(any()),
        ).thenAnswer(
          (_) async => throw const ResponseErrors.unexpectedError(),
        );
        return EmailLoginCubit(mockEmailLoginUseCase);
      },
      act: (cubit) => cubit.onLogin(),
      expect: () => [
        EmailLoginState.initial().copyWith(
          status: const BaseStatus.loading(),
        ),
        EmailLoginState.initial().copyWith(
          status: const BaseStatus.failure(
            ResponseErrors.unexpectedError(),
          ),
        ),
      ],
    );
  });
}
