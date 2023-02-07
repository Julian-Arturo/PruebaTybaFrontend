import '../../export.dart';

class ListUniversityScreen extends StatefulWidget {
  const ListUniversityScreen({super.key});

  @override
  State<ListUniversityScreen> createState() => _ListUniversityScreenState();
}

class _ListUniversityScreenState extends State<ListUniversityScreen> {
  List<UniversityModel>? _data = [];
  final scroll = ScrollController();
  final controller = Get.put(UniversityController());
  //Variable que se asigna para los 20 items
  @override
  void initState() {
    super.initState();
    scroll.addListener(
      () {
        _scrollListerner();
      },
    );
    getDataUniversity();
  }

  //Obtener la data para mostrarla
  Future<void> getDataUniversity() async {
    var response = await controller.getDataUniversity();
    setState(() {
      _data = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    Responsive size = Responsive(context);
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: _data != null
            ? GetBuilder<UniversityController>(
                init: UniversityController(),
                initState: (_) {},
                builder: (_) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                  left: 10,
                                  top: 30,
                                ),
                                padding:
                                    const EdgeInsets.only(top: 50, left: 15),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_back_ios_rounded,
                                      size: size.height * 0.03,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 50, top: 70),
                              child: Botton(
                                  font: 30,
                                  text: "Cambiar",
                                  onTap: () => _.changerVal()),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 50),
                        child: Center(
                          child: FittedBox(
                            child: Column(
                              children: [
                                const Text(
                                  'Universidades',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 50,
                                      fontFamily: "Acme Regular"),
                                ),
                                Container(
                                  width: size.width,
                                  height: size.height * 0.86,
                                  margin: const EdgeInsets.only(
                                      left: 20, right: 20, top: 30),
                                  child: UniversityListItem(
                                    tap: _.tap,
                                    limit: _.limit,
                                    scroll: scroll,
                                    data: _data!,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                })
            : const CircularProgressIndicator(),
      )),
    );
  }

  //Validacion del scroll
  void _scrollListerner() {
    if (scroll.position.pixels == scroll.position.maxScrollExtent) {
      setState(() {
        controller.limit += 20;
      });
    }
  }
}
