import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MetaInterceptor extends InterceptorsWrapper {
  MetaInterceptor();

  static String nMetaHeaderKey = 'n-meta';

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Accept'] = 'application/json; charset=UTF-8';
    options.headers['content-type'] = 'application/json';
    options.headers['X-API-KEY'] = 'owwn-challenge-22bbdk';
    options.headers[nMetaHeaderKey] = '$platform;'
        '${await appVersion};${await platformVersion};${await device}';
    handler.next(options);
  }

  DeviceInfoPlugin get deviceInfo => DeviceInfoPlugin();

  String get platform {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return 'android';
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return 'ios';
    } else {
      return 'web';
    }
  }

  Future<String?> get platformVersion async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return (await deviceInfo.androidInfo).version.release;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return (await deviceInfo.iosInfo).systemVersion;
    }
    return 'unknown';
  }

  Future<String> get appVersion async {
    return PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      return packageInfo.version;
    }).onError((error, stackTrace) => '0.0.0');
  }

  Future<String?> get device async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return (await deviceInfo.androidInfo).model;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return (await deviceInfo.iosInfo).utsname.machine;
    }
    return 'unknown';
  }
}
