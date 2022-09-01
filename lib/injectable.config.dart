// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i4;

import 'core/di/logger_module.dart' as _i18;
import 'core/di/network_module.dart' as _i19;
import 'data/local/database/app_database.dart' as _i3;
import 'data/local/source/post_dao.dart' as _i5;
import 'data/local/source/user_dao.dart' as _i6;
import 'data/remote/client/post_api_client.dart' as _i8;
import 'data/remote/client/user_api_client.dart' as _i11;
import 'data/remote/source/post_remote_source.dart' as _i9;
import 'data/remote/source/user_remote_source.dart' as _i12;
import 'domain/usecases/post_list_usecase.dart' as _i14;
import 'domain/usecases/user_list_usecase.dart' as _i15;
import 'presentation/bloc/post_list/post_list_bloc.dart' as _i16;
import 'presentation/bloc/user_list/user_list_bloc.dart' as _i17;
import 'repository/post_repository.dart' as _i10;
import 'repository/user_repository.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final loggerModule = _$LoggerModule();
  final networkModule = _$NetworkModule();
  gh.singleton<_i3.AppDatabase>(_i3.AppDatabase());
  gh.lazySingleton<_i4.Logger>(() => loggerModule.logger);
  gh.factory<_i5.PostDao>(() => _i5.PostDao(get<_i3.AppDatabase>()));
  gh.factory<String>(() => networkModule.baseUrl, instanceName: 'baseUrl');
  gh.factory<_i6.UserDao>(() => _i6.UserDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i7.Interceptor>(
      () => networkModule.interceptor(get<_i4.Logger>()));
  gh.lazySingleton<_i7.Dio>(() => networkModule.dio(get<_i7.Interceptor>()));
  gh.singleton<_i8.PostApiClient>(_i8.PostApiClient(get<_i7.Dio>(),
      baseUrl: get<String>(instanceName: 'baseUrl')));
  gh.factory<_i9.PostRemoteDataSource>(
      () => _i9.PostRemoteDataSourceImpl(get<_i8.PostApiClient>()));
  gh.factory<_i10.PostRepository>(() => _i10.PostRepositoryImpl(
      get<_i5.PostDao>(), get<_i9.PostRemoteDataSource>()));
  gh.singleton<_i11.UserApiClient>(_i11.UserApiClient(get<_i7.Dio>(),
      baseUrl: get<String>(instanceName: 'baseUrl')));
  gh.factory<_i12.UserRemoteDataSource>(
      () => _i12.UserRemoteDataSourceImpl(get<_i11.UserApiClient>()));
  gh.factory<_i13.UserRepository>(() => _i13.UserRepositoryImpl(
      get<_i6.UserDao>(), get<_i12.UserRemoteDataSource>()));
  gh.factory<_i14.PostListUseCase>(
      () => _i14.PostListUseCase(get<_i10.PostRepository>()));
  gh.factory<_i15.UserListUserCase>(
      () => _i15.UserListUserCase(get<_i13.UserRepository>()));
  gh.factory<_i16.PostListBloc>(
      () => _i16.PostListBloc(get<_i14.PostListUseCase>()));
  gh.factory<_i17.UserListBloc>(
      () => _i17.UserListBloc(get<_i15.UserListUserCase>()));
  return get;
}

class _$LoggerModule extends _i18.LoggerModule {}

class _$NetworkModule extends _i19.NetworkModule {}
