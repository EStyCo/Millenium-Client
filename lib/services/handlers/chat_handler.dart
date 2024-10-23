import 'package:client/services/local/user_storage.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/models/chat/message.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ChatHandler extends ChangeNotifier {
  final storage = GetIt.I<UserStorage>();

  late String serverUrl;
  late HubConnection hubConnection = HubConnectionBuilder().withUrl('').build();
  late List<Message> messages = [];

  Future stopConnection() async {
    hubConnection.stop();
  }

  void _updateChat(List<dynamic>? args) {
    if (args != null) {
      messages.add(Message.fromJson(args[0]));
      if(messages.length > 50)
      {
        messages.remove(messages[0]);
      }
      notifyListeners();
    }
  }

  void _lastMessages(List<dynamic>? args) {
    if (args != null && args.isNotEmpty) {
      messages.clear();
      for (var item in args) {
        var message = Message.fromJson(item);
        messages.add(message);
      }
      notifyListeners();
    }
  }

  void addMessages(String data) async {
    final name = GetIt.I<UserStorage>().character.name;
    if (hubConnection.state == HubConnectionState.connected) {
      await hubConnection.invoke('AddMessage', args: [data, name]);
    }
    notifyListeners();
  }

  Future<void> connectHub() async {
    serverUrl = '${BaseUrl.Get()}/ChatHub';
    final name = GetIt.I<UserStorage>().character.name;
    hubConnection = HubConnectionBuilder().withUrl(serverUrl).build();

    hubConnection.keepAliveIntervalInMilliseconds = 3000000;

    hubConnection.on('UpdateChat', _updateChat);

    if (hubConnection.state != HubConnectionState.connected) {
      await hubConnection.start();
      await hubConnection.invoke('ConnectToHub', args: [name]);
      _lastMessages(await hubConnection.invoke('LastMessages'));
    }
  }
}
