import 'dart:core';
import 'package:client/models/Request/name_request.dart';
import 'package:client/services/local/user_storage.dart';
import 'package:client/services/web/logs_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LogsListHandler extends ChangeNotifier {
  LogsListHandler() {
    getlogsList();
  }
  final storage = GetIt.I<UserStorage>();
  final List<String> _logsList = [];
  List<String> get logsList => _logsList;

  Future getlogsList() async {
    logsList.clear();
    try {
      var response = await LogsService()
          .getListLogs(NameRequest(name: storage.character.name));
      if (response.isSuccess) {
        var list = response.result?['list'] as List;
        _logsList.addAll(list.map((e) => e.toString()).toList().reversed);
      }
    } catch (_) {
      print('Ошибка загрузки логов!');
    }
    notifyListeners();
  }

  void updatelogList(List<dynamic>? args) {
    //_logsList.clear();
    if (args != null) {
      _logsList.insert(0,args[0] as String);
    }
    notifyListeners();
  }
}
