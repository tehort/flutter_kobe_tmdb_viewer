import 'package:dio/dio.dart';
import 'package:tmdb_viewer/core/errors/exceptions.dart';

class ApiErrorHandler {
  static void handleError(e) {
    var errorDescription = '';

    if (e is DioError) {
      switch (e.type) {
        case DioErrorType.CANCEL:
          errorDescription = "Erro: A solicitação para o servidor de API foi cancelada";
          break;
        case DioErrorType.CONNECT_TIMEOUT:
          errorDescription = "Erro: Tempo limite de conexão com o servidor de API";
          break;
        case DioErrorType.DEFAULT:
          errorDescription = "Erro: Falha na conexão com o servidor de API devido à conexão com a Internet";
          break;
        case DioErrorType.RECEIVE_TIMEOUT:
          errorDescription = "Erro: Tempo limite de recebimento com o servidor de API";
          break;
        case DioErrorType.RESPONSE:
          errorDescription = "Erro: Código de status inválido recebido: ${e.response.statusCode}";
          break;
        case DioErrorType.SEND_TIMEOUT:
          errorDescription = "Erro: Tempo limite de envio com o servidor de API";
          break;
      }
    } else if (e is FormatException) {
      errorDescription = "Erro: Formato de resposta inesperado";
    } else {
      errorDescription = "Erro inesperado ocorreu";
    }

    throw Failure(errorDescription);
  }
}
