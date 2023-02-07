import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:pruebatyba/data/api/api_test.dart';
import 'package:pruebatyba/pages/list_university/repository/repository.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    final Dio dio = Dio();
    Logger logger = Logger();
    Http http = Http(
      dio: dio,
      logger: logger,
      logsEnable: true,
    );

    final UniversityResponse response = UniversityResponse(http);
    Get.put(response);
  }
}
