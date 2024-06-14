import 'package:client/models/stats.dart';

class UpdateStatRequest {
  String name;
  int freePoints;
  int strength;
  int agility;
  int intelligence;

  UpdateStatRequest({
    required this.name,
    required this.freePoints,
    required this.strength,
    required this.agility,
    required this.intelligence,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'freePoints': freePoints,
      'strength': strength,
      'agility': agility,
      'intelligence': intelligence,
    };
  }

  factory UpdateStatRequest.mapFromStats(Stats stats, String name) {
    return UpdateStatRequest(
      name: name,
      freePoints: stats.freePoints,
      strength: stats.strength,
      agility: stats.agility,
      intelligence: stats.intelligence,
    );
  }
}
