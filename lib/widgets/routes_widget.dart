import 'package:client/bloc/action_screen/action_screen_bloc.dart';
import 'package:client/services/handlers/battle_place_handler.dart';
import 'package:client/services/local/route_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class RoutesWidget extends ConsumerWidget {
  RoutesWidget({super.key});

  final handler = GetIt.I<BattlePlaceHandler>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(
      ChangeNotifierProvider<BattlePlaceHandler>(
        (ref) => handler,
      ),
    );

    final ActionScreenBloc actionBloc =
        BlocProvider.of<ActionScreenBloc>(context);
    return ExpansionTile(
      title: const Text(
        'Пути',
        style: TextStyle(fontSize: 15),
      ),
      backgroundColor: Colors.white,
      collapsedBackgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      children: [
        if (provider.routes.isEmpty)
          const Text('Loading..')
        else
          Column(
            children: List.generate(
              provider.routes.length,
              (index) {
                return ElevatedButton(
                  child: Text(RouteService()
                      .getActionEvent(provider.routes[index])
                      .name),
                  onPressed: () => actionBloc.add(
                    RouteService().getActionEvent(provider.routes[index]),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
