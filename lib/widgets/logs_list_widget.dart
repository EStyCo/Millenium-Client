import 'package:client/services/handlers/logs_list_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class LogsListWidget extends ConsumerStatefulWidget {
  const LogsListWidget({super.key});

  @override
  ConsumerState<LogsListWidget> createState() {
    return LogsListWidgetState();
  }
}

class LogsListWidgetState extends ConsumerState<LogsListWidget> {
  final handler = GetIt.I<LogsListHandler>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollToTop();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _scrollToTop() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) _scrollController.jumpTo(0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(
      ChangeNotifierProvider<LogsListHandler>(
        (ref) => handler,
      ),
    );

    Color changeColor(int index) {
      if (index.isEven) {
        return Colors.black12;
      }
      return Colors.white;
    }

    if (provider.logsList.isEmpty) {
      return const Center(
        child: Text('Записей нет'),
      );
    } else {
      return SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            provider.logsList.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  color: changeColor(index),
                  child: Text(
                    provider.logsList[index],
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
  }
}
