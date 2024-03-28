enum LoginMethods {
  emailPassword("Email/Password");

  final String value;

  const LoginMethods(this.value);

  String get methodName => value;

}
