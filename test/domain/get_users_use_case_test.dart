import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:owwn_coding_challenge/data/repositories/user/user_repository.dart';
import 'package:owwn_coding_challenge/data/services/response_errors.dart';
import 'package:owwn_coding_challenge/domain/entities/requests/get_user_request_model.dart';
import 'package:owwn_coding_challenge/domain/entities/responses/user/get_users_response.dart';
import 'package:owwn_coding_challenge/domain/usecases/user/get_users_usecase.dart';


class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late final MockUserRepository mockUserRepository;
  late final GetUsersCase getUsersCase;

  setUpAll(() {
    registerFallbackValue(GetUsersResponse.mock());
    registerFallbackValue(GetUserRequestModel.mock());
    mockUserRepository = MockUserRepository();
    getUsersCase = GetUsersCase(
      mockUserRepository,
    );
  });

  group('GetUsersCase', () {
    test(
      'should return Get User if successful',
      () async {
        when(
          () => mockUserRepository.getListOfUsers(1),
        ).thenAnswer((_) async => GetUsersResponse.mock());
        await getUsersCase.run(1);

        verify(
          () => mockUserRepository.getListOfUsers(1),
        );

        verifyNoMoreInteractions(mockUserRepository);
      },
    );

    test(
      'should halt function and throw exception on error',
      ()  {
        when(
          () =>mockUserRepository.getListOfUsers(1),
        ).thenAnswer((_) async => throw const ResponseErrors<dynamic>.unexpectedError());

        final result = getUsersCase.run(1);
        verify(
          () => mockUserRepository.getListOfUsers(1),
        );

        verifyNoMoreInteractions(mockUserRepository);
        expect(
            result, throwsA(const ResponseErrors<dynamic>.unexpectedError()),);
      },
    );
  });
}
