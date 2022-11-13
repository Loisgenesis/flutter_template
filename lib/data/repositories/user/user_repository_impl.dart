import 'package:injectable/injectable.dart';
import 'package:owwn_coding_challenge/data/repositories/user/source/remote/users_remote_data_source.dart';
import 'package:owwn_coding_challenge/data/repositories/user/user_repository.dart';
import 'package:owwn_coding_challenge/domain/entities/auth/login_response.dart';
import 'package:owwn_coding_challenge/domain/entities/requests/email_request_model.dart';
import 'package:owwn_coding_challenge/domain/entities/responses/user/get_users_response.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final UsersRemoteDataSource _usersRemoteDataSource;

  UserRepositoryImpl(
    this._usersRemoteDataSource,
  );

  @override
  Future<LoginResponse> emailPasswordLogin(EmailRequestModel input) {
    return _usersRemoteDataSource.emailPasswordLogin(input);
  }

  @override
  Future<GetUsersResponse> getListOfUsers() {
    return _usersRemoteDataSource.getListOfUsers();
  }
}
