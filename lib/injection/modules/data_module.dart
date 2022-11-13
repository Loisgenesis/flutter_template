import 'package:dio/dio.dart';
import 'package:owwn_coding_challenge/data/services/http_client/dio_http_client.dart';
import 'package:owwn_coding_challenge/data/services/http_client/http_client.dart';
import 'package:owwn_coding_challenge/injection/injector.dart';

class DataModule {
   Future<void> inject() async {
    injector.registerFactory<DioHttpClient>(() {
      return DioHttpClient(Dio());
    });

    injector.registerFactory<HttpClient>(() {
      return DioHttpClient(Dio());
    });
  }
}
