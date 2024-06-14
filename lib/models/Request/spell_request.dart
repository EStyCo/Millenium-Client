class SpellRequest {
  String name;
  int spellType;
  SpellRequest({required this.name, required this.spellType});

  Map<String, dynamic> toJson() {
    return {'name': name, 'spellType': spellType};
  }
}
