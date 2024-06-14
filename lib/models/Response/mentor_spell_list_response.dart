import 'package:client/models/Spell/mentor_spell.dart';

class MentorSpellListResponse {
  int freePoints;
  List<MentorSpell> spellList = [];
  MentorSpellListResponse({required this.freePoints, required this.spellList});

  factory MentorSpellListResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> spellListJson = json['spellList'];
    List<MentorSpell> spellList = spellListJson
        .map((spellJson) => MentorSpell.fromJson(spellJson))
        .toList();

    return MentorSpellListResponse(
        freePoints: json['freePoints'] as int, spellList: spellList);
  }
}
