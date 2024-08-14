class UseSelfSpell {
  int type;
  String name;
  String place;

  UseSelfSpell({
    required this.type,
    required this.name,
    required this.place,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'name': name,
      'place': place,
    };
  }
}
