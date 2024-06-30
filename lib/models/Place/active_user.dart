import 'package:client/models/Spell/state.dart';

class ActiveUser {
  String name;
  int level;
  int currentHP;
  int maxHP;
  List<State> states;

  ActiveUser(
      {required this.name,
      required this.level,
      required this.currentHP,
      required this.maxHP,
      required this.states});

  factory ActiveUser.fromJson(Map<String, dynamic> json) {
    List<dynamic> statesListJson = json['states'];
    List<State> statesList =
        statesListJson.map((state) => State.fromJson(state)).toList();

    return ActiveUser(
      name: json['name'] as String,
      level: json['level'] as int,
      currentHP: json['currentHP'] as int,
      maxHP: json['maxHP'] as int,
      states: statesList,
    );
  }
}
