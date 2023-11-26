import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/product/constants/settings_constants.dart';
import 'package:riverpod_architecture/product/constants/string_constants.dart';
import 'package:riverpod_architecture/product/navigation/enum/router_items.dart';
import 'package:riverpod_architecture/product/navigation/router.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConstants.appName,
      debugShowCheckedModeBanner: SettingsConstants.isShowDebugBanner,
      initialRoute: RouterItems.splash.routeName,
      onGenerateRoute: Routes().generateRoute,
    );
  }
}
