import 'package:injectable/injectable.dart';
import 'package:owwn_coding_challenge/data/repositories/auth/source/auth_repository.dart';
import 'package:owwn_coding_challenge/data/repositories/auth/source/remote/auth_remote_data_source.dart';
import 'package:owwn_coding_challenge/domain/entities/auth/login_response.dart';
import 'package:owwn_coding_challenge/domain/entities/requests/email_request_model.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(
    this._authRemoteDataSource,
  );

  @override
  Future<LoginResponse> emailPasswordLogin(EmailRequestModel input) {
    return _authRemoteDataSource.emailPasswordLogin(input);
  }
}
