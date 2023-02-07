import '../../export.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive size = Responsive(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          child: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: EdgeInsets.only(
                          left: 40,
                          top: 40,
                          right: 40,
                          bottom: size.height * 0.1,
                        ),
                        child: const Image(
                          image: AssetImage("asset/image/tyba.png"),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
