import 'package:pruebatyba/data/api/api_test.dart';
import 'package:pruebatyba/helper/http_reponse.dart';
import 'package:pruebatyba/pages/list_university/model/university_model.dart';

class UniversityResponse {
  final Http _http;

  UniversityResponse(this._http);

  Future<HttpResponse<List<UniversityModel>>> getDataUniversity() {
    return _http.request(
      path:
          "https://tyba-assets.s3.amazonaws.com/FE-Engineer-test/universities.json",
      parse: (data) => List<Map<String, dynamic>>.from(data)
          .map((u) => UniversityModel.fromJson(u))
          .toList(),
    );
  }
}
