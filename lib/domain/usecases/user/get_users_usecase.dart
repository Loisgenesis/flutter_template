import 'package:injectable/injectable.dart';
import 'package:owwn_coding_challenge/data/repositories/user/user_repository.dart';
import 'package:owwn_coding_challenge/domain/common/use_case.dart';
import 'package:owwn_coding_challenge/domain/entities/responses/user/get_users_response.dart';

@injectable
class GetUsersCase extends OutputUseCase<Future<GetUsersResponse>> {
  final UserRepository _userRepository;

  GetUsersCase(this._userRepository);

  @override
  Future<GetUsersResponse> run() async {
    return _userRepository.getListOfUsers();
  }
}
