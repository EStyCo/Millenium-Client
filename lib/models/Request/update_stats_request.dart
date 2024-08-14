import 'package:client/models/stats.dart';

class UpdateStatRequest {
  String name;
  int freePoints;
  int strength;
  int agility;
  int vitality;
  int intelligence;
  int mastery;
  int luck;

  UpdateStatRequest({
    required this.name,
    required this.freePoints,
    required this.strength,
    required this.agility,
    required this.vitality,
    required this.intelligence,
    required this.mastery,
    required this.luck,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'freePoints': freePoints,
      'strength': strength,
      'agility': agility,
      'vitality': vitality,
      'intelligence': intelligence,
      'mastery': mastery,
      'luck': luck,
    };
  }

  factory UpdateStatRequest.mapFromStats(Stats stats, String name) {
    return UpdateStatRequest(
      name: name,
      freePoints: stats.freePoints,
      strength: stats.strength,
      agility: stats.agility,
      vitality: stats.vitality,
      intelligence: stats.intelligence,
      mastery: stats.mastery,
      luck: stats.luck,
    );
  }
}
