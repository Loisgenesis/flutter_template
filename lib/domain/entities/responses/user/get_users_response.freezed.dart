// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_users_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetUsersResponse _$GetUsersResponseFromJson(Map<String, dynamic> json) {
  return _GetUsersResponse.fromJson(json);
}

/// @nodoc
mixin _$GetUsersResponse {
  List<User> get users => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetUsersResponseCopyWith<GetUsersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUsersResponseCopyWith<$Res> {
  factory $GetUsersResponseCopyWith(
          GetUsersResponse value, $Res Function(GetUsersResponse) then) =
      _$GetUsersResponseCopyWithImpl<$Res, GetUsersResponse>;
  @useResult
  $Res call({List<User> users});
}

/// @nodoc
class _$GetUsersResponseCopyWithImpl<$Res, $Val extends GetUsersResponse>
    implements $GetUsersResponseCopyWith<$Res> {
  _$GetUsersResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
  }) {
    return _then(_value.copyWith(
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetUsersResponseCopyWith<$Res>
    implements $GetUsersResponseCopyWith<$Res> {
  factory _$$_GetUsersResponseCopyWith(
          _$_GetUsersResponse value, $Res Function(_$_GetUsersResponse) then) =
      __$$_GetUsersResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<User> users});
}

/// @nodoc
class __$$_GetUsersResponseCopyWithImpl<$Res>
    extends _$GetUsersResponseCopyWithImpl<$Res, _$_GetUsersResponse>
    implements _$$_GetUsersResponseCopyWith<$Res> {
  __$$_GetUsersResponseCopyWithImpl(
      _$_GetUsersResponse _value, $Res Function(_$_GetUsersResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = null,
  }) {
    return _then(_$_GetUsersResponse(
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetUsersResponse implements _GetUsersResponse {
  const _$_GetUsersResponse({required final List<User> users}) : _users = users;

  factory _$_GetUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetUsersResponseFromJson(json);

  final List<User> _users;
  @override
  List<User> get users {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'GetUsersResponse(users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetUsersResponse &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetUsersResponseCopyWith<_$_GetUsersResponse> get copyWith =>
      __$$_GetUsersResponseCopyWithImpl<_$_GetUsersResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetUsersResponseToJson(
      this,
    );
  }
}

abstract class _GetUsersResponse implements GetUsersResponse {
  const factory _GetUsersResponse({required final List<User> users}) =
      _$_GetUsersResponse;

  factory _GetUsersResponse.fromJson(Map<String, dynamic> json) =
      _$_GetUsersResponse.fromJson;

  @override
  List<User> get users;
  @override
  @JsonKey(ignore: true)
  _$$_GetUsersResponseCopyWith<_$_GetUsersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
