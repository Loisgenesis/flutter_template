import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:owwn_coding_challenge/data/preferences/auth_preferences.dart';
import 'package:owwn_coding_challenge/domain/usecases/authorization/authorization_use_case.dart';

class MockAuthPreferences extends Mock implements AuthPreferences {}

void main() {
  late final MockAuthPreferences mockAuthPreferences;
  late final AuthorizationUseCase authorizationUseCase;

  setUpAll(() {
    mockAuthPreferences = MockAuthPreferences();
    authorizationUseCase = AuthorizationUseCase(
      mockAuthPreferences,
    );
  });

  group('AuthorizationUseCase', () {
    test(
      'should return true if has valid token',
      () async {
        when(
          () => mockAuthPreferences.hasValidAccessToken,
        ).thenReturn(true);

        final result = authorizationUseCase.run();

        verify(() => mockAuthPreferences.hasValidAccessToken);

        verifyNoMoreInteractions(mockAuthPreferences);

        expect(result, equals(true));
      },
    );

    test(
      'should return false if does not have valid token',
      () async {
        when(
          () => mockAuthPreferences.hasValidAccessToken,
        ).thenReturn(false);

        final result = authorizationUseCase.run();

        verify(() => mockAuthPreferences.hasValidAccessToken);

        verifyNoMoreInteractions(mockAuthPreferences);

        expect(result, equals(false));
      },
    );
  });
}
