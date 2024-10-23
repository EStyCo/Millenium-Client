import 'package:client/bloc/stats/stats_bloc.dart';
import 'package:client/bloc/stats/stats_event.dart';
import 'package:client/models/Utilities/stats_type.dart';
import 'package:client/models/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Text(
            '${stats.level} Уровень ${stats.currentExp}/${stats.toLevelExp} exp',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        _buildStatRow(
          context,
          bloc,
          'Сила',
          stats.strength,
          stats.addStrength,
          StatsType.strength,
        ),
        _buildStatRow(
          context,
          bloc,
          'Ловкость',
          stats.agility,
          stats.addAgility,
          StatsType.agility,
        ),
        _buildStatRow(
          context,
          bloc,
          'Выносливость',
          stats.vitality,
          stats.addVitality,
          StatsType.vitality,
        ),
        _buildStatRow(
          context,
          bloc,
          'Интеллект',
          stats.intelligence,
          stats.addIntelligence,
          StatsType.intelligence,
        ),
        _buildStatRow(
          context,
          bloc,
          'Мастерство',
          stats.mastery,
          stats.addMastery,
          StatsType.mastery,
        ),
        _buildStatRow(
          context,
          bloc,
          'Удача',
          stats.luck,
          stats.addLuck,
          StatsType.luck,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            'Free Points: ${stats.freePoints}',
            style: const TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: isChanged
                  ? () {
                      bloc.add(SaveStatsEvent());
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: isChanged ? Colors.blue : Colors.grey,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text('Сохранить'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatRow(
    BuildContext context,
    StatsBloc bloc,
    String label,
    int value,
    int addValue,
    StatsType type,
  ) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            bloc.add(AddStatsEvent(type: type));
          },
          icon: const Icon(Icons.add),
          iconSize: 16,
          color: Colors.green,
        ),
        IconButton(
          onPressed: () {
            bloc.add(ReduceStatsEvent(type: type));
          },
          icon: const Icon(Icons.remove),
          iconSize: 16,
          color: Colors.red,
        ),
        Text(
          '$label: $value',
          style: const TextStyle(fontSize: 14),
        ),
        if(addValue != 0)
        Text(
          ' +$addValue',
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }
}
