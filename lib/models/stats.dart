class Stats {
  int level;
  int currentExp;
  int toLevelExp;
  int freePoints;
  int strength;
  int addStrength;
  int agility;
  int addAgility;
  int vitality;
  int addVitality;
  int intelligence;
  int addIntelligence;
  int mastery;
  int addMastery;
  int luck;
  int addLuck;

  Stats({
    required this.level,
    required this.currentExp,
    required this.toLevelExp,
    required this.freePoints,
    required this.strength,
    required this.addStrength,
    required this.agility,
    required this.addAgility,
    required this.vitality,
    required this.addVitality,
    required this.intelligence,
    required this.addIntelligence,
    required this.mastery,
    required this.addMastery,
    required this.luck,
    required this.addLuck,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      level: json['level'] as int,
      currentExp: json['currentExp'] as int,
      toLevelExp: json['toLevelExp'] as int,
      freePoints: json['freePoints'] as int,
      strength: json['strength'] as int,
      addStrength: json['addStrength'] as int,
      agility: json['agility'] as int,
      addAgility: json['addAgility'] as int,
      vitality: json['vitality'] as int,
      addVitality: json['addVitality'] as int,
      intelligence: json['intelligence'] as int,
      addIntelligence: json['addIntelligence'] as int,
      mastery: json['mastery'] as int,
      addMastery: json['addMastery'] as int,
      luck: json['luck'] as int,
      addLuck: json['addLuck'] as int,
    );
  }
}
