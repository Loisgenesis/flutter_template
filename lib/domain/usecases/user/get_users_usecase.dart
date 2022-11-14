import 'package:injectable/injectable.dart';
import 'package:owwn_coding_challenge/data/repositories/user/user_repository.dart';
import 'package:owwn_coding_challenge/domain/common/use_case.dart';
import 'package:owwn_coding_challenge/domain/entities/requests/get_user_request_model.dart';
import 'package:owwn_coding_challenge/domain/entities/responses/user/get_users_response.dart';

@injectable
class GetUsersCase
    extends UseCase<GetUserRequestModel, Future<GetUsersResponse>> {
  final UserRepository _userRepository;

  GetUsersCase(this._userRepository);

  @override
  Future<GetUsersResponse> run(GetUserRequestModel input) async {
    return _userRepository.getListOfUsers(input);
  }
}
