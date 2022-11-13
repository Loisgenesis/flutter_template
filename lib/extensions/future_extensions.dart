import 'package:flutter/foundation.dart';
import 'package:owwn_coding_challenge/data/services/response_errors.dart';

extension FutureExtensions<T> on Future<T> {
  Future<T> catchPrintError(Function onError) {
    return catchError((e, s) {
      if (kDebugMode) {
        debugPrint(e.toString());
        debugPrint(s.toString());
      }

      final parsedError = ResponseErrors.fromDioError(e);
      onError.call(parsedError, s);
    });
  }
}
