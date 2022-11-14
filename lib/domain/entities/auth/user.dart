// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String name,
    required String gender,
    required String status,
    required String partner_id,
    required DateTime created_at,
  }) = _User;
  const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
