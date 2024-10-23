import 'package:client/models/Spell/state.dart';
import 'package:client/models/item.dart';

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
  List<Item> rewards;

  DetailsMonster(
      {required this.name,
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
      required this.rewards});

  factory DetailsMonster.fromJson(Map<String, dynamic> json) {
    List<dynamic> listStatesJson = json['states'];
    List<State> statesList =
        listStatesJson.map((state) => State.fromJson(state)).toList();
    List<dynamic> listRewardsJson = json['rewards'];
    List<Item> rewardsList =
        listRewardsJson.map((item) => Item.fromJson(item)).toList();

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
        rewards: rewardsList);
  }
}
