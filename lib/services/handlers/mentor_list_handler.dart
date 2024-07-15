import 'package:client/models/Request/name_request.dart';
import 'package:client/models/Request/spell_request.dart';
import 'package:client/models/Response/mentor_spell_list_response.dart';
import 'package:client/models/Spell/mentor_spell.dart';
import 'package:client/services/local/user_storage.dart';
import 'package:client/services/web/mentor_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MentorListHandler extends ChangeNotifier {
  MentorListHandler() {
    getSpellList();
  }
  int freePoints = 0;
  int totalPoints = 0;
  late List<MentorSpell> spellList = [];
  final mentorService = MentorService();
  final storage = GetIt.I<UserStorage>();

  Future<void> getSpellList() async {
    final response = await mentorService
        .getListSpells(NameRequest(name: storage.character.name));

    if (response.isSuccess) {
      _clearList();
      final mentorSpellListResponse =
          MentorSpellListResponse.fromJson(response.result!);
      freePoints = mentorSpellListResponse.freePoints;
      totalPoints = mentorSpellListResponse.totalPoints;
      spellList = mentorSpellListResponse.spellList;
      notifyListeners();
    }
  }

  Future<void> learnSpell(int spellType) async {
    await mentorService.learnSpell(SpellRequest(
        name: storage.character.name, spellType: spellType));
    await getSpellList();
  }

  Future<void> forgotSpell(int spellType) async {
    await mentorService.forgotSpell(SpellRequest(
        name: storage.character.name, spellType: spellType));
    await getSpellList();
  }

  void _clearList() {
    spellList.clear();
  }
}
