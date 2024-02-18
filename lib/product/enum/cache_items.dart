import '../init/app_cache.dart';

enum CacheItems {
  token('token'),
  language('language');

  final String value;

  const CacheItems(this.value);

  String get read => AppCache.instance.sharedPreferences.getString(value) ?? '';

  Future<bool> write(String text) =>
      AppCache.instance.sharedPreferences.setString(value, text);
}
