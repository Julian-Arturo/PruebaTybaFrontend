import '../../../export.dart';

class TextFielBtn extends GetWidget<ControllerInfo> {
  TextFielBtn({
    super.key,
  });

  String? numberStuden = "";

  @override
  Widget build(BuildContext context) {
    Responsive size = Responsive(context);

    return Column(
      children: [
        Form(
          key: controller.key,
          child: Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(30),
              ),
              width: size.width * 0.8,
              child: TextFormField(
                controller: controller.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Ingrese un numero por favor";
                  }
                  return null;
                },
                onChanged: (value) {},
                keyboardType: TextInputType.number,
                cursorHeight: 30,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration.collapsed(
                    hintStyle: TextStyle(fontSize: 20),
                    hintText: "Ingresa el numero de estudiantes"),
              )),
        ),
        TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.orange)),
          onPressed: () {
            if (controller.key.currentState!.validate()) {
              controller.getcarater();
            }
          },
          child: const Text(
            "Asignar numero",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontFamily: "Acme Regular"),
          ),
        )
      ],
    );
  }
}
