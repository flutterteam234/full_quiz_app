import 'package:riverpod_architecture/product/initialize/app_cache.dart';

enum CacheItems {
  token('token');

  final String value;

  const CacheItems(this.value);

  String get read => AppCache.instance.sharedPreferences.getString(value) ?? '';

  Future<bool> write(String value) =>
      AppCache.instance.sharedPreferences.setString(value, value);
}
