import 'package:flutter/material.dart';
import 'package:riverpod_architecture/generated/locale_keys.g.dart';
import 'package:riverpod_architecture/product/constants/settings_constants.dart';
import 'package:riverpod_architecture/product/widget/text/locale_text.dart';
import 'package:url_launcher/url_launcher.dart';

@immutable
class ConnectionError {
  const ConnectionError._();

  static void showNoInternetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const LocaleText(
            text: LocaleKeys.errorMessages_connectionLost,
          ), content: const LocaleText(text: LocaleKeys.errorMessages_connectionLostMessage),

          icon: const Icon(Icons.signal_wifi_statusbar_connected_no_internet_4, color: Colors.white),
          actions: [
            TextButton(
              onPressed: () {
                _openInternetSettings();
              },
              child: Text("Open Internet Settings"),
            ),
          ],
        );
      },
    );
  }

  static void _openInternetSettings() async {
    if (await canLaunch(SettingsConstants.settingsPath)) {
      await launch(SettingsConstants.settingsPath);
    } else {
      throw 'Could not launch internet settings';
    }
  }
}
