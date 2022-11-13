import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:owwn_coding_challenge/domain/entities/auth/login_response.dart';
import 'package:owwn_coding_challenge/domain/entities/requests/email_request_model.dart';
import 'package:owwn_coding_challenge/injection/modules/network_module.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_remote_data_source.g.dart';

@RestApi()
@lazySingleton
abstract class AuthRemoteDataSource {
  @factoryMethod
  factory AuthRemoteDataSource(@Named(NetworkModule.instanceAuth) Dio dio) =
      _AuthRemoteDataSource;

  @POST('/auth')
  Future<LoginResponse> emailPasswordLogin(
    @Body() EmailRequestModel body,
  );
}
