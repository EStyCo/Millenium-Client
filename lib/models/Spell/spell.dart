class Spell {
  int spellType;
  String name;
  int coolDown;
  int restSeconds;
  String? description;
  String? imagePath;
  bool isReady;

  Spell({
    required this.spellType,
    required this.name,
    required this.coolDown,
    required this.restSeconds,
    required this.description,
    required this.imagePath,
    required this.isReady,
  });

  factory Spell.fromJson(Map<String, dynamic> json) {
    return Spell(
      spellType: json['spellType'] as int,
      name: json['name'] as String,
      coolDown: json['coolDown'] as int,
      restSeconds: json['restSeconds'] as int,
      description: json['description'] as String?,
      imagePath: json['imagePath'] as String?,
      isReady: json['isReady'] as bool,
    );
  }
}
