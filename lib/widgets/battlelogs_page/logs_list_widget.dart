import 'package:client/services/handlers/logs_list_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:client/regex_converter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class LogsListWidget extends ConsumerStatefulWidget {
  const LogsListWidget({super.key});

  @override
  ConsumerState<LogsListWidget> createState() {
    return LogsListWidgetState();
  }
}

class LogsListWidgetState extends ConsumerState<LogsListWidget> {
  final _scrollController = ScrollController();

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
        (ref) => GetIt.I<LogsListHandler>(),
      ),
    );

    if (provider.logsList.isEmpty) {
      return const Center(
        child: Text('Записей нет'),
      );
    } else {
      return SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          children: List.generate(
            provider.logsList.length,
            (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 5, top: index == 0 ? 5 : 0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 214, 213, 213),
                        width: 1.5),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3),
                        child: RichText(
                          text: RegexConverter()
                              .parsing(provider.logsList[index].data),
                        ),
                      ),
                      const Divider(
                        color: Color.fromARGB(255, 214, 213, 213),
                        thickness: 2,
                        height: 5,
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, bottom: 2, top: 2),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.av_timer,
                              color: Color.fromARGB(200, 0, 0, 0),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                provider.logsList[index].time,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(200, 0, 0, 0),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
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
