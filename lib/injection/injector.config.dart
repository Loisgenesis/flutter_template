// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../data/preferences/auth_preferences.dart' as _i12;
import '../data/repositories/auth/source/auth_repository.dart' as _i5;
import '../data/repositories/auth/source/auth_repository_impl.dart' as _i6;
import '../data/repositories/auth/source/remote/auth_remote_data_source.dart'
    as _i3;
import '../data/repositories/user/source/remote/user_remote_data_source.dart'
    as _i9;
import '../data/repositories/user/user_repository.dart' as _i10;
import '../data/repositories/user/user_repository_impl.dart' as _i11;
import '../domain/usecases/authorization/authorization_use_case.dart' as _i13;
import '../domain/usecases/authorization/clear_local_user_data_use_case.dart'
    as _i14;
import '../domain/usecases/login/email_login_use_case.dart' as _i15;
import '../domain/usecases/user/get_users_usecase.dart' as _i16;
import '../presentation/common/bloc/authorization_cubit.dart' as _i19;
import '../presentation/common/navigation/navigation_manager.dart' as _i7;
import '../presentation/feature/home/cubit/home_cubit.dart' as _i17;
import '../presentation/feature/home/cubit/home_state.dart' as _i18;
import '../presentation/feature/login/email_login_cubit.dart' as _i20;
import 'modules/register_module.dart'
    as _i21; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i3.AuthRemoteDataSource>(
      () => _i3.AuthRemoteDataSource(get<_i4.Dio>(instanceName: 'AUTH')));
  gh.lazySingleton<_i5.AuthRepository>(
      () => _i6.AuthRepositoryImpl(get<_i3.AuthRemoteDataSource>()));
  gh.lazySingleton<_i7.NavigationManager>(() => _i7.NavigationManager());
  await gh.factoryAsync<_i8.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i9.UserRemoteDataSource>(
      () => _i9.UserRemoteDataSource(get<_i4.Dio>(instanceName: 'DEFAULT')));
  gh.lazySingleton<_i10.UserRepository>(
      () => _i11.UserRepositoryImpl(get<_i9.UserRemoteDataSource>()));
  gh.factory<_i12.AuthPreferences>(
      () => _i12.AuthPreferences(get<_i8.SharedPreferences>()));
  gh.factory<_i13.AuthorizationUseCase>(
      () => _i13.AuthorizationUseCase(get<_i12.AuthPreferences>()));
  gh.factory<_i14.ClearLocalUserDataAndSettingsUseCase>(() =>
      _i14.ClearLocalUserDataAndSettingsUseCase(get<_i12.AuthPreferences>()));
  gh.factory<_i15.EmailLoginUseCase>(() => _i15.EmailLoginUseCase(
        get<_i5.AuthRepository>(),
        get<_i12.AuthPreferences>(),
      ));
  gh.factory<_i16.GetUsersCase>(
      () => _i16.GetUsersCase(get<_i10.UserRepository>()));
  gh.factoryParam<_i17.HomeCubit, _i18.HomeState?, dynamic>((
    state,
    _,
  ) =>
      _i17.HomeCubit(
        get<_i16.GetUsersCase>(),
        state: state,
      ));
  gh.lazySingleton<_i19.AuthorizationCubit>(() => _i19.AuthorizationCubit(
        get<_i13.AuthorizationUseCase>(),
        get<_i14.ClearLocalUserDataAndSettingsUseCase>(),
      ));
  gh.factory<_i20.EmailLoginCubit>(
      () => _i20.EmailLoginCubit(get<_i15.EmailLoginUseCase>()));
  return get;
}

class _$RegisterModule extends _i21.RegisterModule {}
