import 'package:client/models/Request/name_request.dart';
import 'package:client/models/Spell/state.dart' as s;
import 'package:client/services/local/user_storage.dart';
import 'package:client/services/web/stats_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

class BuffBarHandler extends ChangeNotifier {
  BuffBarHandler() {
    getlogsList();
  }
  late UserStorage storage = GetIt.I<UserStorage>();
  late List<s.State> stateslist = [];

  Future getlogsList() async {
    stateslist.clear();
    try {
      var response = await StatsService()
          .getStates(NameRequest(name: storage.character.name));
      if (response.isSuccess) {
        var list = response.result?['list'] as List;
        stateslist
            .addAll(list.map((state) => s.State.fromJson(state)).toList());
      }
    } catch (_) {
      print('Ошибка загрузки стейтов!');
    }
    notifyListeners();
  }

  void updateBuffBar(List<dynamic>? args) {
    stateslist.clear();
    if (args != null) {
      for (var item in args[0]) {
        var state = s.State.fromJson(item);
        stateslist.add(state);
      }
      //stateslist = args[0].map((state) => s.State.fromJson(state)).toList();
    }
    notifyListeners();
  }
}