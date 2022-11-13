import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String sex,
    required String status,
    required String partnerId,
    required DateTime createdAt,
  }) = _User;
  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
