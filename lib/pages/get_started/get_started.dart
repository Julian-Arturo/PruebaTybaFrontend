import '../../export.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive size = Responsive(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "DEV TYBA",
                  style: TextStyle(
                      fontFamily: "Acme Regular",
                      color: Colors.green,
                      fontSize: size.height * 0.1,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    "Dolor adipisicing mollit dolore eu sint ullamco cupidatat est non aliquip cupidatat exercitation eu adipisicing. Commodo sit adipisicing cupidatat aute. Dolor cupidatat do culpa qui esse aliqua anim consectetur eu consectetur.",
                    style: TextStyle(
                        color: Colors.black38,
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Image(
                  image: AssetImage('asset/image/image.png'),
                ),
                Botton(
                  font: 50,
                  text: "Siguiente",
                  onTap: () => Get.toNamed(
                    AppRoutes.universityList,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
