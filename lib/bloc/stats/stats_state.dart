import 'package:client/bloc/stats/stats_bloc.dart';
import 'package:client/bloc/stats/stats_event.dart';
import 'package:client/models/Utilities/stats_type.dart';
import 'package:client/models/stats.dart';
import 'package:client/services/local/user_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class StatsState extends StatelessWidget {
  const StatsState({super.key});
}

class LoadingStatsState extends StatsState {
  const LoadingStatsState({super.key});

  @override
  Widget build(BuildContext context) {
    final StatsBloc bloc = BlocProvider.of<StatsBloc>(context);

    bloc.add(GetStatsEvent());
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class LoadedStatsState extends StatsState {
  const LoadedStatsState(
      {super.key, required this.stats, required this.isChanged});
  final Stats stats;
  final bool isChanged;

  @override
  Widget build(BuildContext context) {
    final StatsBloc bloc = BlocProvider.of<StatsBloc>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
              '${GetIt.I<UserStorage>().character.name} -  ${stats.level} lvl ${stats.currentExp}/${stats.toLevelExp} exp'),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                bloc.add(AddStatsEvent(type: StatsType.strength));
              },
              icon: const Icon(Icons.add),
              iconSize: 15,
            ),
            IconButton(
              onPressed: () {
                bloc.add(ReduceStatsEvent(type: StatsType.strength));
              },
              icon: const Icon(Icons.remove),
              iconSize: 15,
            ),
            Text('Strength: ${stats.strength}'),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                bloc.add(AddStatsEvent(type: StatsType.agility));
              },
              icon: const Icon(Icons.add),
              iconSize: 15,
            ),
            IconButton(
              onPressed: () {
                bloc.add(ReduceStatsEvent(type: StatsType.agility));
              },
              icon: const Icon(Icons.remove),
              iconSize: 15,
            ),
            Text('Agility: ${stats.agility}'),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                bloc.add(AddStatsEvent(type: StatsType.intelligence));
              },
              icon: const Icon(Icons.add),
              iconSize: 15,
            ),
            IconButton(
              onPressed: () {
                bloc.add(ReduceStatsEvent(type: StatsType.intelligence));
              },
              icon: const Icon(Icons.remove),
              iconSize: 15,
            ),
            Text('Intelligence: ${stats.intelligence}'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text('Free Points: ${stats.freePoints}'),
        ),
        Row(
          children: [
            ElevatedButton(
                onPressed: isChanged
                    ? () {
                        bloc.add(SaveStatsEvent());
                      }
                    : null,
                child: const Text('Сохранить'))
          ],
        )
      ],
    );
  }
}
