class MentorSpell {
  int spellType;
  String name;
  int coolDown;
  String? description;
  String? imagePath;
  bool isLearning;

  MentorSpell({
    required this.spellType,
    required this.name,
    required this.coolDown,
    required this.description,
    required this.imagePath,
    required this.isLearning,
  });

  factory MentorSpell.fromJson(Map<String, dynamic> json) {
    return MentorSpell(
      spellType: json['spellType'] as int,
      name: json['name'] as String,
      coolDown: json['coolDown'] as int,
      description: json['description'] as String?,
      imagePath: json['imagePath'] as String?,
      isLearning: json['isLearning'] as bool,
    );
  }
}
