import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:pruebatyba/helper/http_reponse.dart';

class Http {
  late Dio _dio;
  late Logger _logger;

  Http({
    required Dio dio,
    required Logger logger,
    required bool logsEnable,
  }) {
    _dio = dio;
    _logger = logger;
  }

  Future<HttpResponse<T>> request<T>({
    required String path,
    String method = "GET",
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, String>? header,
    T Function(dynamic data)? parse,
    dynamic formData,
  }) async {
    try {
      final Response response = await _dio.request(
        path,
        options: Options(
          method: method,
          headers: header,
        ),
        queryParameters: queryParameters,
        data: formData != null ? FormData.fromMap(formData) : data,
      );
      //_logger.i(response.data);
      if (parse != null) {
        return HttpResponse.succes<T>(parse(response.data));
      }
      return HttpResponse.succes<T>(response.data);
    } catch (e) {
      _logger.e(e);

      int? statusCode = 0;
      String? message = "unknow error";
      dynamic data;

      if (e is DioError) {
        statusCode = -1;
        message = e.message;
        if (e.response != null) {
          statusCode = e.response?.statusCode;
          message = e.response?.statusMessage;
          data = e.response?.data;
        }
      }

      return HttpResponse.failed(
        statusCode: statusCode,
        message: message,
        data: data,
      );
    }
  }
}
