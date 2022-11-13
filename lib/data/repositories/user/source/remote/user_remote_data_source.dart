import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:owwn_coding_challenge/domain/entities/responses/user/get_users_response.dart';
import 'package:owwn_coding_challenge/injection/modules/network_module.dart';
import 'package:retrofit/retrofit.dart';

part 'user_remote_data_source.g.dart';

@RestApi()
@lazySingleton
abstract class UserRemoteDataSource {
  @factoryMethod
  factory UserRemoteDataSource(@Named(NetworkModule.instanceDefault) Dio dio) =
      _UserRemoteDataSource;

  @GET('/users')
  Future<GetUsersResponse> getListOfUsers();
}
