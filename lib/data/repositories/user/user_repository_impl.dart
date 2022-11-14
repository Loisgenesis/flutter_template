import 'package:injectable/injectable.dart';
import 'package:owwn_coding_challenge/data/repositories/user/source/remote/user_remote_data_source.dart';
import 'package:owwn_coding_challenge/data/repositories/user/user_repository.dart';
import 'package:owwn_coding_challenge/domain/entities/requests/get_user_request_model.dart';
import 'package:owwn_coding_challenge/domain/entities/responses/user/get_users_response.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource _usersRemoteDataSource;

  UserRepositoryImpl(
    this._usersRemoteDataSource,
  );

  @override
  Future<GetUsersResponse> getListOfUsers(
      GetUserRequestModel getUserRequestModel) {
    return _usersRemoteDataSource.getListOfUsers(
        limit: getUserRequestModel.limit, page: getUserRequestModel.page);
  }
}
