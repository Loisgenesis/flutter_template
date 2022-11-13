import 'package:freezed_annotation/freezed_annotation.dart';

part 'email_request_model.freezed.dart';
part 'email_request_model.g.dart';

@freezed
class EmailRequestModel with _$EmailRequestModel {
  const factory EmailRequestModel({
    required String email,
  }) = _EmailRequestModel;

  factory EmailRequestModel.createModel({
    required String email,
  }) {
    return EmailRequestModel(
      email: email,
    );
  }

  @visibleForTesting
  factory EmailRequestModel.mock() {
    return const EmailRequestModel(
      email: 'test@test.com',
    );
  }

  factory EmailRequestModel.fromJson(Map<String, dynamic> json) =>
      _$EmailRequestModelFromJson(json);
}
