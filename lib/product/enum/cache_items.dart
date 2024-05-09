import 'package:riverpod_architecture/product/package/sharedPreferences/shared_preference_manager.dart';

enum CacheItems {
  token('token'),
  language('language'),
  themeMode('themeMode');

  final String value;

  const CacheItems(this.value);

  String get read => SharedPreferenceManager.instance.sharedPreferences.getString(value) ?? '';

  Future<bool> write(String text) =>
      SharedPreferenceManager.instance.sharedPreferences.setString(value, text);
}
