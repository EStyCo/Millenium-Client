import 'package:client/widgets/battlelogs_page/battlelog_title.dart';
import 'package:client/widgets/battlelogs_page/logs_list_widget.dart';
import 'package:flutter/material.dart';

class LogsScreen extends StatelessWidget {
  const LogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 214, 213, 213),
      child: const Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Column(
          children: [
            BattleLogTitle(),
            Expanded(
              child: LogsListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
