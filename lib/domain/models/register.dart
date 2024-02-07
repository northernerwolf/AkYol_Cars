class RegistrationRequest {
  final String phone;
  final String password;
  final String passwordConf;

  RegistrationRequest(
      {required this.phone,
      required this.password,
      required this.passwordConf});

  Map<String, dynamic> toJson() {
    return {
      "phone": phone,
      "password": password,
      "password_conf": passwordConf,
    };
  }
}
