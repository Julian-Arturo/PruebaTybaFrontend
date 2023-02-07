import '../../../export.dart';

class SplashController extends GetxController {
  //Cambio de pantalla luego de un tiempo
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.toNamed(AppRoutes.getStarted);
    });
    super.onInit();
  }
}
