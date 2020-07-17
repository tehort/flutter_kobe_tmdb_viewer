import 'package:dio/dio.dart';
import 'package:dio_retry/dio_retry.dart';
import 'package:get_it/get_it.dart';
import 'package:tmdb_viewer/core/network/network_constants.dart';
import 'package:tmdb_viewer/ui/screens/app_home/tab_selector_store.dart';

final sl = GetIt.instance;

void init() {
  sl.registerSingleton(TabSelectorStore());

  GetIt.instance.registerFactory<Dio>(
    () {
      var dio = Dio(
        BaseOptions(
          baseUrl: NetworkConstants.baseUrl,
          connectTimeout: NetworkConstants.connectTimeout,
          receiveTimeout: NetworkConstants.receiveTimeout,
          sendTimeout: NetworkConstants.sendTimeout,
          queryParameters: {
            'api_key': NetworkConstants.apiKey,
          },
        ),
      );

      dio.interceptors.add(
        RetryInterceptor(
          dio: dio,
          options: const RetryOptions(
            retries: 3,
            retryInterval: Duration(seconds: 1),
          ),
        ),
      );

      return dio;
    },
  );
}
