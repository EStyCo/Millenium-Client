import 'package:client/models/Spell/spell.dart';

class SpellListResponse {
  bool canAttack;
  int globalRestSeconds;
  List<Spell> spellList;

  SpellListResponse({
    required this.canAttack,
    required this.globalRestSeconds,
    required this.spellList,
  });

  factory SpellListResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> spellListJson = json['spellList'];
    List<Spell> spellList =
        spellListJson.map((spellJson) => Spell.fromJson(spellJson)).toList();
    return SpellListResponse(
      canAttack: json['canAttack'] as bool,
      globalRestSeconds: json['globalRestSeconds'] as int,
      spellList: spellList,
    );
  }
}
