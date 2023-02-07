// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import '../../export.dart';

class InformationScreen extends StatelessWidget {
  String name;
  String domains;
  String country;
  String webpages;

  InformationScreen({
    Key? key,
    required this.name,
    required this.domains,
    required this.country,
    required this.webpages,
  }) : super(key: key);

  String? imgaePath;

  String? number = "";

  String? numberStuden = "";

  final controller = Get.put(ControllerInfo());
  @override
  Widget build(BuildContext context) {
    Responsive size = Responsive(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Back(),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 50),
              child: Center(
                child: FittedBox(
                  child: Column(
                    children: const [
                      Text(
                        'Informacion de las \n Universidades',
                        style: TextStyle(
                            color: Colors.orange,
                            fontSize: 50,
                            fontFamily: "Acme Regular"),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GetBuilder<ControllerInfo>(
              init: ControllerInfo(),
              initState: (_) {},
              builder: (_) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  child: Text(
                    "Number student : ${_.val?.text ?? ''}",
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: "Acme Regular"),
                  ),
                );
              },
            ),
            //Data recolectada

            Data(type: "Nombre :", university: name),
            Data(type: "Dominio :", university: domains),
            Data(type: "Pais :", university: country),
            Data(type: "Pagina Web :", university: webpages),
            const SizedBox(
              height: 40,
            ),

            //Funcion de camara y galeria
            const CameraGalery(),

            // Asignar numero de estudiantes
            TextFielBtn()
          ],
        ),
      ),
    );
  }
}
