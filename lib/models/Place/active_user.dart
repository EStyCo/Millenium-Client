class ActiveUser {
  String name;
  int level;

  ActiveUser({required this.name, required this.level});

  factory ActiveUser.fromJson(Map<String, dynamic> json) {
    return ActiveUser(
      name: json['name'] as String,
      level: json['level'] as int,
    );
  }
}
