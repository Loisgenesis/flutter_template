import 'dart:developer';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:owwn_coding_challenge/data/interceptor/auth_interceptor.dart';
import 'package:owwn_coding_challenge/data/interceptor/meta_interceptor.dart';
import 'package:owwn_coding_challenge/data/services/http_client/dio_http_client.dart';
import 'package:owwn_coding_challenge/domain/api/api_config.dart';
import 'package:owwn_coding_challenge/injection/injector.dart';
import 'package:owwn_coding_challenge/presentation/common/bloc/authorization_cubit.dart';

class NetworkModule {
  static const String instanceDefault = 'DEFAULT';
  static const String instanceAuth = 'AUTH';
  Future<void> inject() async {
    const isHttpRequestLoggingEnabled = kDebugMode;

    injector.registerLazySingleton<Dio>(
      () {
        final Dio dio = Dio();
        dio.httpClientAdapter = DefaultHttpClientAdapter();
        dio.options.baseUrl = injector.get<ApiConfig>().apiUrl;
        dio.interceptors.add(MetaInterceptor());
        dio.interceptors.add(
          AuthInterceptor(
            httpClient: DioHttpClient(dio),
            authPreferences: injector(),
            refreshTokenHttpClient: injector(),
            onTokenExpired: () {
              // Handle log out
              injector.get<AuthorizationCubit>().updateAuthorization();
            },
          ),
        );
        if (isHttpRequestLoggingEnabled) {
          dio.interceptors.add(
            LogInterceptor(
              requestBody: true,
              responseBody: true,
              logPrint: print,
            ),
          );
        }

        return dio;
      },
      instanceName: instanceAuth,
    );

    injector.registerLazySingleton<Dio>(
      () {
        final dio = Dio();
        dio.httpClientAdapter = DefaultHttpClientAdapter();
        dio.options.baseUrl = injector.get<ApiConfig>().apiUrl;
        dio.interceptors.add(MetaInterceptor());
        dio.interceptors.add(
          AuthInterceptor(
            httpClient: DioHttpClient(dio),
            authPreferences: injector(),
            refreshTokenHttpClient: DioHttpClient(
              injector.get<Dio>(instanceName: instanceAuth),
            ),
            onTokenExpired: () {
              injector.get<AuthorizationCubit>().updateAuthorization();
            },
          ),
        );
        if (isHttpRequestLoggingEnabled) {
          dio.interceptors.add(
            LogInterceptor(
              requestBody: true,
              responseBody: true,
              logPrint: print,
            ),
          );
        }
        return dio;
      },
      instanceName: instanceDefault,
    );
  }

  static void print(Object? object) {
    final String line = "$object";
    log(line);
  }
}
