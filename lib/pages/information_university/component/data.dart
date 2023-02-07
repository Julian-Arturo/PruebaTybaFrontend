import '../../../export.dart';

class Data extends StatelessWidget {
  const Data({
    Key? key,
    required this.type,
    required this.university,
  }) : super(key: key);

  final String type;
  final String university;

  @override
  Widget build(BuildContext context) {
    Responsive size = Responsive(context);

    return Container(
      width: size.width * 0.9,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            type,
            style: const TextStyle(
                color: Colors.black, fontSize: 35, fontFamily: "Acme Regular"),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: size.width * 0.4,
            child: Text(
              university,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: "Acme Regular"),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
