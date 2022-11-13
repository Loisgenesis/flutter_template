// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../data/preferences/auth_preferences.dart' as _i7;
import '../data/repositories/user/source/remote/users_remote_data_source.dart'
    as _i5;
import '../data/repositories/user/user_repository.dart' as _i10;
import '../data/repositories/user/user_repository_impl.dart' as _i11;
import '../domain/usecases/authorization/authorization_use_case.dart' as _i8;
import '../domain/usecases/authorization/clear_local_user_data_use_case.dart'
    as _i9;
import '../domain/usecases/login/email_login_use_case.dart' as _i13;
import '../domain/usecases/user/get_users_usecase.dart' as _i14;
import '../presentation/common/bloc/authorization_cubit.dart' as _i12;
import '../presentation/common/navigation/navigation_manager.dart' as _i3;
import '../presentation/feature/login/email_login_cubit.dart' as _i15;
import 'modules/register_module.dart'
    as _i16; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.NavigationManager>(() => _i3.NavigationManager());
  await gh.factoryAsync<_i4.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i5.UsersRemoteDataSource>(
      () => _i5.UsersRemoteDataSource(get<_i6.Dio>()));
  gh.factory<_i7.AuthPreferences>(
      () => _i7.AuthPreferences(get<_i4.SharedPreferences>()));
  gh.factory<_i8.AuthorizationUseCase>(
      () => _i8.AuthorizationUseCase(get<_i7.AuthPreferences>()));
  gh.factory<_i9.ClearLocalUserDataAndSettingsUseCase>(() =>
      _i9.ClearLocalUserDataAndSettingsUseCase(get<_i7.AuthPreferences>()));
  gh.lazySingleton<_i10.UserRepository>(
      () => _i11.UserRepositoryImpl(get<_i5.UsersRemoteDataSource>()));
  gh.lazySingleton<_i12.AuthorizationCubit>(() => _i12.AuthorizationCubit(
        get<_i8.AuthorizationUseCase>(),
        get<_i9.ClearLocalUserDataAndSettingsUseCase>(),
      ));
  gh.factory<_i13.EmailLoginUseCase>(() => _i13.EmailLoginUseCase(
        get<_i10.UserRepository>(),
        get<_i7.AuthPreferences>(),
      ));
  gh.factory<_i14.GetMeUseCase>(
      () => _i14.GetMeUseCase(get<_i10.UserRepository>()));
  gh.factory<_i15.EmailLoginCubit>(
      () => _i15.EmailLoginCubit(get<_i13.EmailLoginUseCase>()));
  return get;
}

class _$RegisterModule extends _i16.RegisterModule {}
