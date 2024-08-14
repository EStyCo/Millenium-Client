import 'package:client/models/Request/Spells/attack_user.dart';
import 'package:client/models/Request/Spells/use_self_spell.dart';
import 'package:client/models/Response/spell_list_response.dart';
import 'package:client/services/handlers/battle_place_handler.dart';
import 'package:client/services/local/user_storage.dart';
import 'package:client/models/Request/Spells/attack_monster.dart';
import 'package:client/models/Request/name_request.dart';
import 'package:client/services/web/combat_service.dart';
import 'package:client/services/web/spell_service.dart';
import 'package:client/models/Spell/spell.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'dart:async';

class SpellListHandler extends ChangeNotifier {
  final place = GetIt.I<BattlePlaceHandler>();
  final storage = GetIt.I<UserStorage>();

  bool canAttack = true;
  int globalRestSeconds = 0;

  final List<Spell> _spellList = [];
  List<Spell> get spellList => _spellList;
  set spellList(List<Spell> list) {
    _spellList.clear();
    _spellList.addAll(list);
  }

  Future getSpellList() async {
    try {
      var response = await SpellService()
          .getListSpells(NameRequest(name: storage.character.name));
      if (response.isSuccess &&
          response.result != null &&
          response.result!.isNotEmpty) {
        var resp = SpellListResponse.fromJson(response.result!);
        canAttack = resp.canAttack;
        globalRestSeconds = resp.globalRestSeconds;
        spellList = resp.spellList;
      }
    } catch (_) {
      print('Ошибка загрузки скиллов!');
    }
    notifyListeners();
  }

  void useSpell(int skillType) {
    Spell? spell =
        spellList.firstWhere((spell) => spell.spellType == skillType);

    if (spell.isReady) {
      spell.isReady = false;
      notifyListeners();
      if (spell.selfUse) {
        useSelfSpell(skillType);
        return;
      }
      if (place.targetIndex == -1) {
        _attackUser(skillType);
      } else {
        _attackMonster(skillType);
      }
    }
  }

  void _attackMonster(int skillType) async {
    await CombatService().attackMonster(
      AttackMonster(
          idMonster: place.targetIndex,
          type: skillType,
          name: storage.character.name,
          place: storage.character.place),
    );
  }

  void _attackUser(int skillType) async {
    await CombatService().attackUser(
      AttackUser(
          type: skillType,
          nameUser: storage.character.name,
          nameTarget: place.targetName,
          place: storage.character.place),
    );
  }

  void useSelfSpell(int skillType) async {
    await CombatService().useSelfSpell(
      UseSelfSpell(
          type: skillType,
          name: storage.character.name,
          place: storage.character.place),
    );
  }
}
