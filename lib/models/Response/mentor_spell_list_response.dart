import 'package:client/models/Spell/mentor_spell.dart';

class MentorSpellListResponse {
  int freePoints;
  int totalPoints;
  List<MentorSpell> spellList = [];
  MentorSpellListResponse({required this.freePoints, required this.spellList, required this.totalPoints});

  factory MentorSpellListResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> spellListJson = json['spellList'];
    List<MentorSpell> spellList = spellListJson
        .map((spellJson) => MentorSpell.fromJson(spellJson))
        .toList();

    return MentorSpellListResponse(
      freePoints: json['freePoints'] as int,
      totalPoints: json['totalPoints'] as int,
      spellList: spellList,
    );
  }
}
