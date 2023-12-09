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
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _editingController,
            obscureText: passwordgoz,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              iconColor: Colors.white,
              suffixIcon: Icon(Icons.mail_outline),
              hintText: metin,
              labelText: metin,
              fillColor: Colors.white,
              hintStyle: TextStyle(color: Colors.white),
              labelStyle: TextStyle(color: Colors.white),
              floatingLabelStyle: TextStyle(color: Colors.white),
              suffixIconColor: Colors.white,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.white), // Aktif durumda çizginin rengi
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color:
                        Colors.white), // Aktif olmayan durumda çizginin rengi
              ),
            ),
          )),
          eye,
        ],
      ),
    );
  }
}
/**/