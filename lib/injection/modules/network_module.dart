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

class NetworkModule {
   Future<void> inject() async {
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
            },
          ),
        );
        dio.interceptors.add(LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: print,
        ));

        checkForCharlesProxy(dio);

        return dio;
      },
    );
  }

  static void print(Object? object) {
    final String line = "$object";
    log(line);
  }

  static void checkForCharlesProxy(Dio dio) {
    const charlesIp = bool.hasEnvironment('CHARLES_PROXY_IP')
        ? String.fromEnvironment('CHARLES_PROXY_IP')
        : null;

    if (charlesIp == null) return;
    debugPrint('#CharlesProxyEnabled');
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.findProxy = (uri) => 'PROXY $charlesIp:8888;';
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }
}
