import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
      required TextEditingController editingController,
      required this.metin,
      required this.eye,
      required this.passwordgoz})
      : _editingController = editingController,
        super(key: key);

  final TextEditingController _editingController;
  final String metin;
  final Padding eye;
  final bool passwordgoz;
  // ignore: body_might_complete_normally_nullable

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFa7e0d0),

      /*  BoxDecoration(
        color: Color.fromARGB(255, 64, 68, 75),
        borderRadius: BorderRadius.circular(10),
      ),*/
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                cursorColor: Colors.white,
                style: Theme.of(context).textTheme.titleMedium,
                obscureText: passwordgoz,
                controller: _editingController,
                decoration:
                    InputDecoration(hintText: metin, border: InputBorder.none),
              ),
            ),
            eye,
          ],
        ),
      ),
    );
  }
}
