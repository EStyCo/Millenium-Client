import 'dart:core';
import 'package:client/models/Request/name_request.dart';
import 'package:client/models/Response/battle_logs.dart';
import 'package:client/services/local/user_storage.dart';
import 'package:client/services/web/logs_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LogsListHandler extends ChangeNotifier {
  LogsListHandler() {
    getlogsList();
  }
  final storage = GetIt.I<UserStorage>();
  final List<BattleLog> _logsList = [];
  List<BattleLog> get logsList => _logsList;

  Future getlogsList() async {
    logsList.clear();
    try {
      var response = await LogsService()
          .getListLogs(NameRequest(name: storage.character.name));
      if (response.isSuccess) {
        var list = response.result?['list'] as List;
        _logsList.addAll(list
            .map((e) => BattleLog.fromJson(e as Map<String, dynamic>))
            .toList()
            .reversed);
      }
    } catch (_) {
      print('Ошибка загрузки логов!');
    }
    notifyListeners();
  }

  void updatelogList(List<dynamic>? args) {
    if (args != null) {
      _logsList.insert(0, BattleLog.fromJson(args[0]));
    }
    notifyListeners();
  }
}
