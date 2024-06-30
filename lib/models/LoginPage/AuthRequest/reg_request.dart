class RegRequest {
  final String name;
  final String email;
  final String password;
  int race;
  RegRequest({
    required this.name,
    required this.email,
    required this.password,
    this.race = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'race': 0,
    };
  }
}
