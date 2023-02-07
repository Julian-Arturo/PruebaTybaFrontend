import '../../../export.dart';

class UniversityController extends GetxController {
  final universityData = Get.find<UniversityResponse>();
  int limit = 20;
  bool tap = false;

  @override
  void onReady() {
    super.onReady();
    getDataUniversity();
  }

  @override
  void onInit() {
    getDataUniversity();
    super.onInit();

    update();
  }

  changerVal() {
    if (tap == false) {
      tap = true;
      update();
    } else {
      tap = false;
      update();
    }
  }

  //Data de api
  Future getDataUniversity() async {
    var response = await universityData.getDataUniversity();
    return response.data;
  }
}
