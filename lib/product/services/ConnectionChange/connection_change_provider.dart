import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'network_change_manager.dart';

final connectionChangeLoggerProvider = Provider<ConnectionChangeLogger>((ref) {
  return ConnectionChangeLogger();
});
