import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio createDio() {
    final baseOptions = BaseOptions(
      baseUrl: 'https://659f86b15023b02bfe89c737.mockapi.io',
    );

    return Dio()
      ..options = baseOptions
      ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ));
  }
}
