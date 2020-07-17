import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:tmdb_viewer/core/errors/exceptions.dart';
import 'package:tmdb_viewer/injection_container.dart';

class DioClient {
  DioClient();

  final Dio _dio = sl.get<Dio>();

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    try {
      if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
        throw Failure('Verifique sua conexão com a internet.');
      }

      final response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    try {
      if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
        throw Failure('Verifique sua conexão com a internet.');
      }

      final response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
