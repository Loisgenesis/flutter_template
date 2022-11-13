// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'email_login_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EmailLoginState {
  Email get email => throw _privateConstructorUsedError;
  BaseStatus<dynamic> get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmailLoginStateCopyWith<EmailLoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailLoginStateCopyWith<$Res> {
  factory $EmailLoginStateCopyWith(
          EmailLoginState value, $Res Function(EmailLoginState) then) =
      _$EmailLoginStateCopyWithImpl<$Res, EmailLoginState>;
  @useResult
  $Res call({Email email, BaseStatus<dynamic> status});

  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class _$EmailLoginStateCopyWithImpl<$Res, $Val extends EmailLoginState>
    implements $EmailLoginStateCopyWith<$Res> {
  _$EmailLoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BaseStatusCopyWith<dynamic, $Res> get status {
    return $BaseStatusCopyWith<dynamic, $Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EmailLoginStateCopyWith<$Res>
    implements $EmailLoginStateCopyWith<$Res> {
  factory _$$_EmailLoginStateCopyWith(
          _$_EmailLoginState value, $Res Function(_$_EmailLoginState) then) =
      __$$_EmailLoginStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Email email, BaseStatus<dynamic> status});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get status;
}

/// @nodoc
class __$$_EmailLoginStateCopyWithImpl<$Res>
    extends _$EmailLoginStateCopyWithImpl<$Res, _$_EmailLoginState>
    implements _$$_EmailLoginStateCopyWith<$Res> {
  __$$_EmailLoginStateCopyWithImpl(
      _$_EmailLoginState _value, $Res Function(_$_EmailLoginState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? status = null,
  }) {
    return _then(_$_EmailLoginState(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as Email,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
    ));
  }
}

/// @nodoc

class _$_EmailLoginState extends _EmailLoginState {
  _$_EmailLoginState({required this.email, required this.status}) : super._();

  @override
  final Email email;
  @override
  final BaseStatus<dynamic> status;

  @override
  String toString() {
    return 'EmailLoginState(email: $email, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmailLoginState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmailLoginStateCopyWith<_$_EmailLoginState> get copyWith =>
      __$$_EmailLoginStateCopyWithImpl<_$_EmailLoginState>(this, _$identity);
}

abstract class _EmailLoginState extends EmailLoginState {
  factory _EmailLoginState(
      {required final Email email,
      required final BaseStatus<dynamic> status}) = _$_EmailLoginState;
  _EmailLoginState._() : super._();

  @override
  Email get email;
  @override
  BaseStatus<dynamic> get status;
  @override
  @JsonKey(ignore: true)
  _$$_EmailLoginStateCopyWith<_$_EmailLoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
