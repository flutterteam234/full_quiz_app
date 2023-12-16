import 'package:flutter/material.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';
import 'package:riverpod_architecture/product/constants/text_family_constants.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
      required TextEditingController editingController,
      required this.metin,
      required this.eye,
      required this.passwordgoz,
      required this.icon})
      : _editingController = editingController,
        super(key: key);

  final TextEditingController _editingController;
  final String metin;
  final Padding eye;
  final bool passwordgoz;
  final IconButton icon;
  // ignore: body_might_complete_normally_nullable

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            style: TextFamilyConstrants.bodyLargeBlack.getFont,
            controller: _editingController,
            obscureText: passwordgoz,
            cursorColor: ColorConstants.black.getColor,
            decoration: InputDecoration(
              iconColor: ColorConstants.black.getColor,
              suffixIcon: icon,
              hintText: metin,
              fillColor: ColorConstants.black.getColor,
              hintStyle: TextFamilyConstrants.bodyLargeBlack.getFont,
              labelStyle: TextFamilyConstrants.bodyLargeBlack.getFont,
              floatingLabelStyle:
                  TextStyle(color: ColorConstants.black.getColor),
              suffixIconColor: ColorConstants.black.getColor,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: ColorConstants
                        .black.getColor), // Aktif durumda çizginin rengi
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: ColorConstants.black
                        .getColor), // Aktif olmayan durumda çizginin rengi
              ),
            ),
          )),
        ],
      ),
    );
  }
}
/**/