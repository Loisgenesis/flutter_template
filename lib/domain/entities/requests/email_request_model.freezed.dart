// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'email_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EmailRequestModel _$EmailRequestModelFromJson(Map<String, dynamic> json) {
  return _EmailRequestModel.fromJson(json);
}

/// @nodoc
mixin _$EmailRequestModel {
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmailRequestModelCopyWith<EmailRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailRequestModelCopyWith<$Res> {
  factory $EmailRequestModelCopyWith(
          EmailRequestModel value, $Res Function(EmailRequestModel) then) =
      _$EmailRequestModelCopyWithImpl<$Res, EmailRequestModel>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$EmailRequestModelCopyWithImpl<$Res, $Val extends EmailRequestModel>
    implements $EmailRequestModelCopyWith<$Res> {
  _$EmailRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmailRequestModelCopyWith<$Res>
    implements $EmailRequestModelCopyWith<$Res> {
  factory _$$_EmailRequestModelCopyWith(_$_EmailRequestModel value,
          $Res Function(_$_EmailRequestModel) then) =
      __$$_EmailRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$_EmailRequestModelCopyWithImpl<$Res>
    extends _$EmailRequestModelCopyWithImpl<$Res, _$_EmailRequestModel>
    implements _$$_EmailRequestModelCopyWith<$Res> {
  __$$_EmailRequestModelCopyWithImpl(
      _$_EmailRequestModel _value, $Res Function(_$_EmailRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$_EmailRequestModel(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EmailRequestModel implements _EmailRequestModel {
  const _$_EmailRequestModel({required this.email});

  factory _$_EmailRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_EmailRequestModelFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'EmailRequestModel(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmailRequestModel &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmailRequestModelCopyWith<_$_EmailRequestModel> get copyWith =>
      __$$_EmailRequestModelCopyWithImpl<_$_EmailRequestModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmailRequestModelToJson(
      this,
    );
  }
}

abstract class _EmailRequestModel implements EmailRequestModel {
  const factory _EmailRequestModel({required final String email}) =
      _$_EmailRequestModel;

  factory _EmailRequestModel.fromJson(Map<String, dynamic> json) =
      _$_EmailRequestModel.fromJson;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_EmailRequestModelCopyWith<_$_EmailRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
