class Stats {
  int level;
  int currentExp;
  int toLevelExp;
  int freePoints;
  int strength;
  int agility;
  int intelligence;

  Stats({
    required this.level,
    required this.currentExp,
    required this.toLevelExp,
    required this.freePoints,
    required this.strength,
    required this.agility,
    required this.intelligence,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      level: json['level'] as int,
      currentExp: json['currentExp'] as int,
      toLevelExp: json['toLevelExp'] as int,
      freePoints: json['freePoints'] as int,
      strength: json['strength'] as int,
      agility: json['agility'] as int,
      intelligence: json['intelligence'] as int,
    );
  }
}
