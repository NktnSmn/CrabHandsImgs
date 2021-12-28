import 'package:dio/dio.dart';

void configureDio(Dio dio) {
  dio.options.baseUrl = 'https://api.unsplash.com';
  dio.options.connectTimeout = 5000;
  dio.options.receiveTimeout = 30000;
  dio.interceptors
    .add(InterceptorsWrapper(onRequest: (options, handler) {
      options.queryParameters['client_id'] = 'Kf9QrsEpaZFwsMoWHxtviozhx5a5j_aqwJi7oSw5OsU';
      handler.next(options);
    }));
    //..add(PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true));
}
