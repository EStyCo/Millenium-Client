class AttackUser {
  int type;
  String nameUser;
  String nameTarget;
  String place;

  AttackUser({
    required this.type,
    required this.nameUser,
    required this.nameTarget,
    required this.place,
  });

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'nameUser': nameUser,
      'nameTarget': nameTarget,
      'place': place,
    };
  }
}
