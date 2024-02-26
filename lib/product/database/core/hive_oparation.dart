import 'package:hive/hive.dart';

import '../model/hive_model.dart';

part '../model/hive_model_mixin.dart';

class HiveDatabaseOperation<T extends HiveModelMixin> with HiveManagerMixin<T> {

  Future<void> addOrUpdateItem(T model) => _box.put(model.key, model);

  T? getItem(String key) => _box.get(key);

  Future<void> deleteItem(String key) => _box.delete(key);
}