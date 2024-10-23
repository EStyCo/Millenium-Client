import 'package:client/services/handlers/chat_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ChatWidget extends ConsumerStatefulWidget {
  const ChatWidget({super.key});

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends ConsumerState<ChatWidget> {
  final handler = GetIt.I<ChatHandler>();
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Прокручиваем вниз при первом построении виджета
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(
      ChangeNotifierProvider<ChatHandler>(
        (ref) => handler,
      ),
    );
    final messages =
        provider.messages.reversed.toList(); // Переворачиваем список сообщений
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: messages.length,
            reverse: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 5, bottom: 5),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: messages[index].time,
                        style: const TextStyle(color: Colors.black87),
                      ),
                      const WidgetSpan(
                        child: SizedBox(width: 4),
                      ),
                      TextSpan(
                        text: messages[index].name,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const WidgetSpan(
                        child: SizedBox(width: 4),
                      ),
                      TextSpan(
                        text: messages[index].data,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    hintText: 'Введите сообщение',
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  final message = _textController.text;
                  if (message.isNotEmpty) {
                    provider.addMessages(message);
                    _textController.clear();
                    _scrollToBottom();
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}