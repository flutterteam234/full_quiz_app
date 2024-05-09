import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_architecture/product/constants/app_theme.dart';
import 'package:riverpod_architecture/product/constants/settings_constants.dart';
import 'package:riverpod_architecture/product/constants/string_constants.dart';
import 'package:riverpod_architecture/product/init/app_start_init.dart';
import 'package:riverpod_architecture/product/navigation/enum/router_items.dart';
import 'package:riverpod_architecture/product/navigation/router.dart';
import 'package:riverpod_architecture/product/notifier/app_theme_notifier.dart';
import 'package:riverpod_architecture/product/package/sharedPreferences/shared_preference_manager.dart';

void main() async {
  await ApplicationStart.init();

  runApp(EasyLocalization(
      useOnlyLangCode: false,
      startLocale: SharedPreferenceManager.instance.getLanguage(),
      supportedLocales: SettingsConstants.SUPPORTED_LOCALE,
      path: SettingsConstants.LANG_PATH,
      child: const ProviderScope(child: MyApp())));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeProvider);

    return MaterialApp(
      themeMode: themeState,
      theme: AppTheme.getLightTheme(),
      darkTheme: AppTheme.getDarkTheme(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: StringConstants.appName,
      debugShowCheckedModeBanner: SettingsConstants.isShowDebugBanner,
      initialRoute: RouterItems.splash.routeName,
      onGenerateRoute: Routes().generateRoute,
    );
  }
}
