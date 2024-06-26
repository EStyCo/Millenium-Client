import 'package:client/bloc/action_screen/action_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RoutesWidget extends ConsumerWidget {
  const RoutesWidget({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ActionScreenBloc actionBloc =
        BlocProvider.of<ActionScreenBloc>(context);
    return ExpansionTile(
      title: const Text(
        'Перейти',
        style: TextStyle(fontSize: 15),
      ),
      backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      children: [
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  actionBloc.add(TownScreenEvent());
                },
                child: const Text('В город'),
              ),
              ElevatedButton(
                child: const Text('Дальше'),
                onPressed: () {
                  actionBloc.add(DarkWoodScreenEvent());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
