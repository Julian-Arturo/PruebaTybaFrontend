import '../../export.dart';

class Botton extends StatelessWidget {
  Botton({
    required this.onTap,
    required this.text,
    this.font,
    super.key,
  });
  void Function()? onTap;
  String text;
  double? font;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(20)),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.orange, fontSize: font, fontFamily: "Acme Regular"),
        ),
      ),
    );
  }
}
