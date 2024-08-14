class Stats {
  int level;
  int currentExp;
  int toLevelExp;
  int freePoints;
  int strength;
  int agility;
  int vitality;
  int intelligence;
  int mastery;
  int luck;

  Stats({
    required this.level,
    required this.currentExp,
    required this.toLevelExp,
    required this.freePoints,
    required this.strength,
    required this.agility,
    required this.vitality,
    required this.intelligence,
    required this.mastery,
    required this.luck,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      level: json['level'] as int,
      currentExp: json['currentExp'] as int,
      toLevelExp: json['toLevelExp'] as int,
      freePoints: json['freePoints'] as int,
      strength: json['strength'] as int,
      agility: json['agility'] as int,
      vitality: json['vitality'] as int,
      intelligence: json['intelligence'] as int,
      mastery: json['mastery'] as int,
      luck: json['luck'] as int,
    );
  }
}
