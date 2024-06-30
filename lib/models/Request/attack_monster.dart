class AttackMonster {
  int idMonster;
  int type;
  String name;
  String place;

  AttackMonster({
    required this.idMonster,
    required this.type,
    required this.name,
    required this.place,
  });

  Map<String, dynamic> toJson() {
    return {
      'idMonster': idMonster,
      'type': type,
      'name': name,
      'place': place,
    };
  }
}
