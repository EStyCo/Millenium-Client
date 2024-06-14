import 'package:client/bloc/action_screen/action_screen_bloc.dart';
import 'package:client/bloc/action_screen/action_screen_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MentorReturnWidget extends StatelessWidget {
  final int freePoints;
  const MentorReturnWidget({super.key, required this.freePoints});

  @override
  Widget build(BuildContext context) {
    final ActionScreenBloc actionBloc =
        BlocProvider.of<ActionScreenBloc>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Text('Свободные очки: $freePoints'),
              ),
              ElevatedButton(
                onPressed: () {
                  actionBloc.add(TownScreenEvent());
                },
                child: const Text('Назад'),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Divider(),
        ),
      ],
    );
  }
}
