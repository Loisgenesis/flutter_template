import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:owwn_coding_challenge/data/model/auth/auth_tokens.dart';
import 'package:owwn_coding_challenge/data/preferences/auth_preferences.dart';
import 'package:owwn_coding_challenge/data/repositories/auth/source/auth_repository.dart';
import 'package:owwn_coding_challenge/data/services/response_errors.dart';
import 'package:owwn_coding_challenge/domain/entities/auth/login_response.dart';
import 'package:owwn_coding_challenge/domain/entities/requests/email_request_model.dart';
import 'package:owwn_coding_challenge/domain/usecases/login/email_login_use_case.dart';

class MockAuthPreferences extends Mock implements AuthPreferences {}

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late final MockAuthPreferences mockAuthPreferences;
  late final MockAuthRepository mockAuthRepository;
  late final EmailLoginUseCase emailLoginUseCase;

  setUpAll(() {
    registerFallbackValue(
      LoginResponse.mock(),
    );
    registerFallbackValue(
      EmailRequestModel.mock(),
    );
    registerFallbackValue(
      AuthTokens.mock(),
    );
    mockAuthPreferences = MockAuthPreferences();
    mockAuthRepository = MockAuthRepository();
    emailLoginUseCase = EmailLoginUseCase(
      mockAuthRepository,
      mockAuthPreferences,
    );
  });

  group('EmailLoginUseCase', () {
    test(
      'should return LoginResponse if successful',
      () async {
        when(
          () => mockAuthRepository.emailPasswordLogin(any()),
        ).thenAnswer((_) async => LoginResponse.mock());
        when(
          () => mockAuthPreferences.setAuthTokens(any()),
        ).thenAnswer((_) async {});
        await emailLoginUseCase.run(EmailRequestModel.mock());

        verify(
          () => mockAuthRepository.emailPasswordLogin(EmailRequestModel.mock()),
        );
        verify(
          () => mockAuthPreferences.setAuthTokens(
            AuthTokens(
              accessToken: LoginResponse.mock().access_token,
              refreshToken: LoginResponse.mock().refresh_token,
            ),
          ),
        );

        verifyNoMoreInteractions(mockAuthRepository);
        verifyNoMoreInteractions(mockAuthPreferences);
      },
    );

    test(
      'should halt function and throw exception on error',
      ()  {
        when(
          () => mockAuthRepository.emailPasswordLogin(any()),
        ).thenAnswer((_) async => throw const ResponseErrors<dynamic>.unexpectedError());

        final result = emailLoginUseCase.run(EmailRequestModel.mock());
        verify(
          () => mockAuthRepository.emailPasswordLogin(EmailRequestModel.mock()),
        );

        verifyNoMoreInteractions(mockAuthRepository);
        verifyNoMoreInteractions(mockAuthPreferences);
        expect(
            result, throwsA(const ResponseErrors<dynamic>.unexpectedError()),);
      },
    );
  });
}
