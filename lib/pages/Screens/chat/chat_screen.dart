import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 5, bottom: 5),
                  child: Text('hellsdag asdg asdgo$index'));
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Введите сообщение',
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
