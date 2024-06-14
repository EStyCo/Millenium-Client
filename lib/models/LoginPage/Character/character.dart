class Character {
  String name;
  String place;

  Character({
    required this.name,
    required this.place,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      place: json['place'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'place': place,
    };
  }
}
