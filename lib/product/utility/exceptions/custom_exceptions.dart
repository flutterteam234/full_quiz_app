
class FirebaseCustomExceptions implements Exception {
  FirebaseCustomExceptions(this.descriptions);

  final String descriptions;

  @override
  String toString() {
    return '$this descriptions';
  }
}
