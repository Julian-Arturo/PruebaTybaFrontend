import 'dart:io';
import 'package:pruebatyba/export.dart';

class CameraGalery extends StatefulWidget {
  const CameraGalery({super.key});

  @override
  State<CameraGalery> createState() => _CameraGaleryState();
}

class _CameraGaleryState extends State<CameraGalery> {
  String? imgaePath;

  @override
  Widget build(BuildContext context) {
    Responsive size = Responsive(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (imgaePath == null)
          Container(
            width: size.height * 0.2,
            height: size.height * 0.2,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: const Image(
                fit: BoxFit.cover,
                image: AssetImage("asset/image/avatar.jpg"),
              ),
            ),
          )
        else
          Container(
            width: size.height * 0.2,
            height: size.height * 0.2,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: Image.file(File(imgaePath!)),
            ),
          ),
        Column(
          children: [
            GestureDetector(
              onTap: () async {
                final ImagePicker piker = ImagePicker();
                XFile? imageFile =
                    await piker.pickImage(source: ImageSource.camera);
                setState(() {
                  imgaePath = imageFile!.path;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(right: 40),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  "Camara",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontFamily: "Acme Regular"),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                final ImagePicker piker = ImagePicker();
                XFile? imageFile =
                    await piker.pickImage(source: ImageSource.gallery);
                setState(() {
                  imgaePath = imageFile!.path;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(right: 40, top: 20),
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  "Galeria",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontFamily: "Acme Regular"),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
