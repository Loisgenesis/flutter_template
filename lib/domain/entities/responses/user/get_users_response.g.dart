// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GetUsersResponse _$$_GetUsersResponseFromJson(Map<String, dynamic> json) =>
    _$_GetUsersResponse(
      users: (json['users'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GetUsersResponseToJson(_$_GetUsersResponse instance) =>
    <String, dynamic>{
      'users': instance.users,
    };
