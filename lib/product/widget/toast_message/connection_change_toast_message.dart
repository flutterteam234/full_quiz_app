import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:riverpod_architecture/product/constants/color_constants.dart';

class ConnectionChangeToastMessage {
  static showToastOn() {
    Fluttertoast.showToast(
      msg: 'Connected to the internet ✅',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(ColorConstants.ligthGreen.toRgba),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static showToastOff() {
    Fluttertoast.showToast(
      msg: 'Internet connection lost ❌',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: Color(ColorConstants.ligthGreen.toRgba),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
