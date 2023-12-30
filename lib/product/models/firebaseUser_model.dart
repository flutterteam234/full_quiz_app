class FirebaseUserModel {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? photoURL;

  FirebaseUserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.photoURL,
  });

  factory FirebaseUserModel.fromJson(Map<String, dynamic> json) {
    return FirebaseUserModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      photoURL: json['photoURL'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'photoURL': photoURL,
    };
  }
}