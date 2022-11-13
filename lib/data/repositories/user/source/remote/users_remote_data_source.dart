import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:owwn_coding_challenge/domain/entities/auth/login_response.dart';
import 'package:owwn_coding_challenge/domain/entities/requests/email_request_model.dart';
import 'package:owwn_coding_challenge/domain/entities/responses/user/get_users_response.dart';
import 'package:retrofit/retrofit.dart';

part 'users_remote_data_source.g.dart';

@RestApi()
@lazySingleton
abstract class UsersRemoteDataSource {
  @factoryMethod
  factory UsersRemoteDataSource(Dio dio) = _UsersRemoteDataSource;

  @POST('/auth')
  Future<LoginResponse> emailPasswordLogin(
    @Body() EmailRequestModel body,
  );

  @GET('/users')
  Future<GetUsersResponse> getListOfUsers();
}
