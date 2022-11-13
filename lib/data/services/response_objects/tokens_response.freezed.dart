// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'tokens_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TokensResponse _$TokensResponseFromJson(Map<String, dynamic> json) {
  return _TokensResponse.fromJson(json);
}

/// @nodoc
mixin _$TokensResponse {
  String get access_token => throw _privateConstructorUsedError;
  String get refresh_token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokensResponseCopyWith<TokensResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokensResponseCopyWith<$Res> {
  factory $TokensResponseCopyWith(
          TokensResponse value, $Res Function(TokensResponse) then) =
      _$TokensResponseCopyWithImpl<$Res, TokensResponse>;
  @useResult
  $Res call({String access_token, String refresh_token});
}

/// @nodoc
class _$TokensResponseCopyWithImpl<$Res, $Val extends TokensResponse>
    implements $TokensResponseCopyWith<$Res> {
  _$TokensResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access_token = null,
    Object? refresh_token = null,
  }) {
    return _then(_value.copyWith(
      access_token: null == access_token
          ? _value.access_token
          : access_token // ignore: cast_nullable_to_non_nullable
              as String,
      refresh_token: null == refresh_token
          ? _value.refresh_token
          : refresh_token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TokensResponseCopyWith<$Res>
    implements $TokensResponseCopyWith<$Res> {
  factory _$$_TokensResponseCopyWith(
          _$_TokensResponse value, $Res Function(_$_TokensResponse) then) =
      __$$_TokensResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String access_token, String refresh_token});
}

/// @nodoc
class __$$_TokensResponseCopyWithImpl<$Res>
    extends _$TokensResponseCopyWithImpl<$Res, _$_TokensResponse>
    implements _$$_TokensResponseCopyWith<$Res> {
  __$$_TokensResponseCopyWithImpl(
      _$_TokensResponse _value, $Res Function(_$_TokensResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? access_token = null,
    Object? refresh_token = null,
  }) {
    return _then(_$_TokensResponse(
      access_token: null == access_token
          ? _value.access_token
          : access_token // ignore: cast_nullable_to_non_nullable
              as String,
      refresh_token: null == refresh_token
          ? _value.refresh_token
          : refresh_token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TokensResponse extends _TokensResponse {
  const _$_TokensResponse(
      {required this.access_token, required this.refresh_token})
      : super._();

  factory _$_TokensResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TokensResponseFromJson(json);

  @override
  final String access_token;
  @override
  final String refresh_token;

  @override
  String toString() {
    return 'TokensResponse(access_token: $access_token, refresh_token: $refresh_token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokensResponse &&
            (identical(other.access_token, access_token) ||
                other.access_token == access_token) &&
            (identical(other.refresh_token, refresh_token) ||
                other.refresh_token == refresh_token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, access_token, refresh_token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokensResponseCopyWith<_$_TokensResponse> get copyWith =>
      __$$_TokensResponseCopyWithImpl<_$_TokensResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokensResponseToJson(
      this,
    );
  }
}

abstract class _TokensResponse extends TokensResponse {
  const factory _TokensResponse(
      {required final String access_token,
      required final String refresh_token}) = _$_TokensResponse;
  const _TokensResponse._() : super._();

  factory _TokensResponse.fromJson(Map<String, dynamic> json) =
      _$_TokensResponse.fromJson;

  @override
  String get access_token;
  @override
  String get refresh_token;
  @override
  @JsonKey(ignore: true)
  _$$_TokensResponseCopyWith<_$_TokensResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
