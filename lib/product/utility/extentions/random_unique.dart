import 'dart:math';

extension UniqueIdExtension on String {
  static String generateUniqueId() {
    final random = Random();
    final randomNumber = random.nextInt(1000000);

    final currentTime = DateTime.now();
    final uniqueId = '${currentTime.microsecondsSinceEpoch}_$randomNumber';

    return uniqueId;
  }
}