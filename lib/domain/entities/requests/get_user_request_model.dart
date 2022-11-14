import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_request_model.freezed.dart';
part 'get_user_request_model.g.dart';

@freezed
class GetUserRequestModel with _$GetUserRequestModel {
  const factory GetUserRequestModel({
    required int limit,
    required int page,
  }) = _GetUserRequestModel;

  factory GetUserRequestModel.createModel({
    required int limit,
    required int page,
  }) {
    return GetUserRequestModel(limit: limit, page: page);
  }

  @visibleForTesting
  factory GetUserRequestModel.mock() {
    return const GetUserRequestModel(
      limit: 20,
      page: 1,
    );
  }

  factory GetUserRequestModel.fromJson(Map<String, dynamic> json) =>
      _$GetUserRequestModelFromJson(json);
}
