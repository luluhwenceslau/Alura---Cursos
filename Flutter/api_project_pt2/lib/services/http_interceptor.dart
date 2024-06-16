// ignore_for_file: avoid_print

import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends InterceptorContract {
  Logger logger = Logger();

  @override
  Future<BaseRequest> interceptRequest({
    required BaseRequest request,
  }) async {
    print('----- Request -----');
    logger.t(request.toString());
    logger.t(request.headers.toString());
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    print('----- Response -----');
    logger.i('Code: ${response.statusCode}');
    if (response is Response) {
      logger.t((response).body);
    }
    return response;
  }
}