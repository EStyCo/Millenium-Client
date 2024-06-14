import 'package:client/models/Spell/state.dart';

class Monster {
  int id;
  int currentHP;
  int maxHP;
  String name;
  String imagePath;
  List<State> states;

  Monster({
    required this.id,
    required this.currentHP,
    required this.maxHP,
    required this.name,
    required this.imagePath,
    required this.states,
  });

  factory Monster.fromJson(Map<String, dynamic> json) {
    List<dynamic> statesListJson = json['states'];
    List<State> statesList = statesListJson.map((state) => State.fromJson(state)).toList();

    return Monster(
      id: json['id'] as int,
      currentHP: json['currentHP'] as int,
      maxHP: json['maxHP'] as int,
      name: json['name'] as String,
      imagePath: json['imagePath'] as String,
      states: statesList
    );
  }
}