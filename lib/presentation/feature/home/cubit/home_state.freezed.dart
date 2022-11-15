// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  BaseStatus<dynamic> get firstFetchStatus =>
      throw _privateConstructorUsedError;
  List<User> get users => throw _privateConstructorUsedError;
  List<User> get newUsers => throw _privateConstructorUsedError;
  BaseStatus<dynamic> get newStatus => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {BaseStatus<dynamic> firstFetchStatus,
      List<User> users,
      List<User> newUsers,
      BaseStatus<dynamic> newStatus,
      int page});

  $BaseStatusCopyWith<dynamic, $Res> get firstFetchStatus;
  $BaseStatusCopyWith<dynamic, $Res> get newStatus;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstFetchStatus = null,
    Object? users = null,
    Object? newUsers = null,
    Object? newStatus = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      firstFetchStatus: null == firstFetchStatus
          ? _value.firstFetchStatus
          : firstFetchStatus // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      newUsers: null == newUsers
          ? _value.newUsers
          : newUsers // ignore: cast_nullable_to_non_nullable
              as List<User>,
      newStatus: null == newStatus
          ? _value.newStatus
          : newStatus // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BaseStatusCopyWith<dynamic, $Res> get firstFetchStatus {
    return $BaseStatusCopyWith<dynamic, $Res>(_value.firstFetchStatus, (value) {
      return _then(_value.copyWith(firstFetchStatus: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BaseStatusCopyWith<dynamic, $Res> get newStatus {
    return $BaseStatusCopyWith<dynamic, $Res>(_value.newStatus, (value) {
      return _then(_value.copyWith(newStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus<dynamic> firstFetchStatus,
      List<User> users,
      List<User> newUsers,
      BaseStatus<dynamic> newStatus,
      int page});

  @override
  $BaseStatusCopyWith<dynamic, $Res> get firstFetchStatus;
  @override
  $BaseStatusCopyWith<dynamic, $Res> get newStatus;
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstFetchStatus = null,
    Object? users = null,
    Object? newUsers = null,
    Object? newStatus = null,
    Object? page = null,
  }) {
    return _then(_$_HomeState(
      firstFetchStatus: null == firstFetchStatus
          ? _value.firstFetchStatus
          : firstFetchStatus // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
      newUsers: null == newUsers
          ? _value._newUsers
          : newUsers // ignore: cast_nullable_to_non_nullable
              as List<User>,
      newStatus: null == newStatus
          ? _value.newStatus
          : newStatus // ignore: cast_nullable_to_non_nullable
              as BaseStatus<dynamic>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_HomeState extends _HomeState {
  _$_HomeState(
      {required this.firstFetchStatus,
      required final List<User> users,
      required final List<User> newUsers,
      required this.newStatus,
      this.page = 1})
      : _users = users,
        _newUsers = newUsers,
        super._();

  @override
  final BaseStatus<dynamic> firstFetchStatus;
  final List<User> _users;
  @override
  List<User> get users {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  final List<User> _newUsers;
  @override
  List<User> get newUsers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newUsers);
  }

  @override
  final BaseStatus<dynamic> newStatus;
  @override
  @JsonKey()
  final int page;

  @override
  String toString() {
    return 'HomeState(firstFetchStatus: $firstFetchStatus, users: $users, newUsers: $newUsers, newStatus: $newStatus, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            (identical(other.firstFetchStatus, firstFetchStatus) ||
                other.firstFetchStatus == firstFetchStatus) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            const DeepCollectionEquality().equals(other._newUsers, _newUsers) &&
            (identical(other.newStatus, newStatus) ||
                other.newStatus == newStatus) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstFetchStatus,
      const DeepCollectionEquality().hash(_users),
      const DeepCollectionEquality().hash(_newUsers),
      newStatus,
      page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  factory _HomeState(
      {required final BaseStatus<dynamic> firstFetchStatus,
      required final List<User> users,
      required final List<User> newUsers,
      required final BaseStatus<dynamic> newStatus,
      final int page}) = _$_HomeState;
  _HomeState._() : super._();

  @override
  BaseStatus<dynamic> get firstFetchStatus;
  @override
  List<User> get users;
  @override
  List<User> get newUsers;
  @override
  BaseStatus<dynamic> get newStatus;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
