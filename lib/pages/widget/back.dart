import '../../export.dart';

class Back extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Responsive size = Responsive(context);

    return Padding(
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
              padding: const EdgeInsets.only(top: 50, left: 15),
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
        ],
      ),
    );
  }
}
