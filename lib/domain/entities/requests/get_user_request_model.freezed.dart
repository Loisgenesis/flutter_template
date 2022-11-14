// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'get_user_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetUserRequestModel _$GetUserRequestModelFromJson(Map<String, dynamic> json) {
  return _GetUserRequestModel.fromJson(json);
}

/// @nodoc
mixin _$GetUserRequestModel {
  int get limit => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetUserRequestModelCopyWith<GetUserRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserRequestModelCopyWith<$Res> {
  factory $GetUserRequestModelCopyWith(
          GetUserRequestModel value, $Res Function(GetUserRequestModel) then) =
      _$GetUserRequestModelCopyWithImpl<$Res, GetUserRequestModel>;
  @useResult
  $Res call({int limit, int page});
}

/// @nodoc
class _$GetUserRequestModelCopyWithImpl<$Res, $Val extends GetUserRequestModel>
    implements $GetUserRequestModelCopyWith<$Res> {
  _$GetUserRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetUserRequestModelCopyWith<$Res>
    implements $GetUserRequestModelCopyWith<$Res> {
  factory _$$_GetUserRequestModelCopyWith(_$_GetUserRequestModel value,
          $Res Function(_$_GetUserRequestModel) then) =
      __$$_GetUserRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit, int page});
}

/// @nodoc
class __$$_GetUserRequestModelCopyWithImpl<$Res>
    extends _$GetUserRequestModelCopyWithImpl<$Res, _$_GetUserRequestModel>
    implements _$$_GetUserRequestModelCopyWith<$Res> {
  __$$_GetUserRequestModelCopyWithImpl(_$_GetUserRequestModel _value,
      $Res Function(_$_GetUserRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? page = null,
  }) {
    return _then(_$_GetUserRequestModel(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetUserRequestModel implements _GetUserRequestModel {
  const _$_GetUserRequestModel({required this.limit, required this.page});

  factory _$_GetUserRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_GetUserRequestModelFromJson(json);

  @override
  final int limit;
  @override
  final int page;

  @override
  String toString() {
    return 'GetUserRequestModel(limit: $limit, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetUserRequestModel &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, limit, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetUserRequestModelCopyWith<_$_GetUserRequestModel> get copyWith =>
      __$$_GetUserRequestModelCopyWithImpl<_$_GetUserRequestModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetUserRequestModelToJson(
      this,
    );
  }
}

abstract class _GetUserRequestModel implements GetUserRequestModel {
  const factory _GetUserRequestModel(
      {required final int limit,
      required final int page}) = _$_GetUserRequestModel;

  factory _GetUserRequestModel.fromJson(Map<String, dynamic> json) =
      _$_GetUserRequestModel.fromJson;

  @override
  int get limit;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_GetUserRequestModelCopyWith<_$_GetUserRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
