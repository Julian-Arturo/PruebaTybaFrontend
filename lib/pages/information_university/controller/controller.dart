import 'package:pruebatyba/export.dart';

class ControllerInfo extends GetxController {
  TextEditingController? val;
  TextEditingController number = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController get caracter => number;

  getcarater() {
    val = caracter;
    update();
  }
}
