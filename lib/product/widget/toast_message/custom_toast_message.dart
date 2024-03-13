
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod_architecture/generated/locale_keys.g.dart';

import '../../constants/color_constants.dart';

class CustomToastMessage{
  CustomToastMessage._();
  static showSaveFailedToast(){
    Fluttertoast.showToast(
      msg: LocaleKeys.editProfile_oparationFailed,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(ColorConstants.ligthGreen.toRgba),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}