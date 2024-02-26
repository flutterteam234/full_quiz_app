
part of '../core/hive_oparation.dart';

mixin HiveManagerMixin<T> {
  final String _key = T.toString();

  late Box<T> _box;

  Future<void> start() async {
    if (Hive.isBoxOpen(_key)) return;
    _box = await Hive.openBox<T>(_key);
  }

  Future<void> clear() => _box.clear();
}
