import 'package:client/models/Spell/state.dart';

class DetailsMonster {
  String name;
  String description;
  int hp;
  int exp;
  String imagePath;
  int minTTimeAttack;
  int maxTTimeAttack;
  int strength;
  int agility;
  int intelligence;
  List<State> states;

  DetailsMonster({
    required this.name,
    required this.description,
    required this.hp,
    required this.exp,
    required this.imagePath,
    required this.minTTimeAttack,
    required this.maxTTimeAttack,
    required this.strength,
    required this.agility,
    required this.intelligence,
    required this.states,
  });

  factory DetailsMonster.fromJson(Map<String, dynamic> json) {
    List<dynamic> statesListJson = json['states'];
    List<State> statesList =
        statesListJson.map((state) => State.fromJson(state)).toList();

    return DetailsMonster(
      name: json['name'] as String,
      description: json['description'] as String,
      hp: json['maxHP'] as int,
      exp: json['exp'] as int,
      imagePath: json['imagePath'] as String,
      minTTimeAttack: json['minTimeAttack'] as int,
      maxTTimeAttack: json['maxTimeAttack'] as int,
      strength: json['strength'] as int,
      agility: json['agility'] as int,
      intelligence: json['intelligence'] as int,
      states: statesList,
    );
  }
}
