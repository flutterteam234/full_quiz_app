import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

abstract class IFlutterCacheManager {
  void init();

  Future<File?> getFile(String? url);

  Future<void> saveFile(String? url);

  Future<void> deleteFile(String? url);
}

class FlutterCacheManager implements IFlutterCacheManager {
  late DefaultCacheManager _cacheManager;

  @override
  Future<void> deleteFile(String? url) async {
    if (url == null) return;
    await _cacheManager.removeFile(url);
  }

  @override
  Future<File?> getFile(String? url) async {
    if (url == null) return null;
    return await _cacheManager.getSingleFile(url);
  }

  @override
  Future<void> saveFile(String? url) async {
    if (url == null) return;
    await _cacheManager.downloadFile(url);
  }

  @override
  void init() {
    _cacheManager = DefaultCacheManager();
  }
}
