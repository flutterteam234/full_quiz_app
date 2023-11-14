import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/feature/auth/authentication_view.dart';
import 'package:riverpod_architecture/product/constants/settings_constants.dart';
import 'package:riverpod_architecture/product/constants/string_constants.dart';
import 'package:riverpod_architecture/product/initialize/app_start_init.dart';

void main() async {
  await ApplicationStart.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: StringConstants.appName,
      debugShowCheckedModeBanner: SettingsConstants.isShowDebugBanner,
      home: AuthenticationView(),
    );
  }
}
