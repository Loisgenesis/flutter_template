// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      name: json['name'] as String,
      sex: json['sex'] as String,
      status: json['status'] as String,
      partnerId: json['partnerId'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sex': instance.sex,
      'status': instance.status,
      'partnerId': instance.partnerId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
