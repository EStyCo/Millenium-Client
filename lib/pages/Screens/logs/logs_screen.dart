import 'package:client/widgets/logs_list_widget.dart';
import 'package:flutter/material.dart';

class LogsScreen extends StatelessWidget {
  const LogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black38),
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 120, 211, 253),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(2, 2),
                  blurRadius: 4,
                  spreadRadius: 1.5,
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'Боевые записи',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.topLeft,
              child: const LogsListWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
