import 'package:client/bloc/stats/stats_event.dart';
import 'package:client/bloc/stats/stats_state.dart';
import 'package:client/models/Request/name_request.dart';
import 'package:client/models/Request/update_stats_request.dart';
import 'package:client/models/Utilities/stats_type.dart';
import 'package:client/models/stats.dart';
import 'package:client/services/local/user_storage.dart';
import 'package:client/services/web/stats_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  final String _name = GetIt.I<UserStorage>().character.name;
  late Stats stats;

  StatsBloc() : super(const LoadingStatsState()) {
    on<GetStatsEvent>(
      (event, emit) async {
        stats = await _getStats();
        emit(LoadedStatsState(stats: stats, isChanged: false));
      },
    );
    on<SaveStatsEvent>(
      (event, emit) async {
        await _saveStats();
        add(GetStatsEvent());
      },
    );
    on<AddStatsEvent>(
      (event, emit) {
        if (stats.freePoints > 0) {
          _changeAddStats(event.type);
          stats.freePoints--;
          emit(LoadedStatsState(stats: stats, isChanged: true));
        }
      },
    );
    on<ReduceStatsEvent>(
      (event, emit) {
        _changeReduceStats(event.type);
        emit(LoadedStatsState(stats: stats, isChanged: true));
      },
    );
  }

  Future<Stats> _getStats() async {
    final response = await StatsService().getStats(NameRequest(name: _name));

    if (response.result == null || !response.isSuccess) {
      throw Exception('No stats data available');
    }

    return Stats.fromJson(response.result as Map<String, dynamic>);
  }

  Future _saveStats() async {
    var response = await StatsService()
        .updateStats(UpdateStatRequest.mapFromStats(stats, _name));
  }

  void _changeAddStats(StatsType type) {
    switch (type) {
      case StatsType.strength:
        stats.strength++;
        break;
      case StatsType.agility:
        stats.agility++;
        break;
      case StatsType.vitality:
        stats.vitality++;
        break;
      case StatsType.intelligence:
        stats.intelligence++;
        break;
      case StatsType.mastery:
        stats.mastery++;
        break;
      case StatsType.luck:
        stats.luck++;
        break;
      default:
        throw ArgumentError('Invalid type: $type');
    }
  }

  void _changeReduceStats(StatsType type) {
    switch (type) {
      case StatsType.strength:
        if (stats.strength > 0) {
          stats.strength--;
          stats.freePoints++;
        }
        break;
      case StatsType.agility:
        if (stats.agility > 0) {
          stats.agility--;
          stats.freePoints++;
        }
        break;
      case StatsType.vitality:
        if (stats.vitality > 0) {
          stats.vitality--;
          stats.freePoints++;
        }
        break;
      case StatsType.intelligence:
        if (stats.intelligence > 0) {
          stats.intelligence--;
          stats.freePoints++;
        }
        break;
        case StatsType.mastery:
        if (stats.mastery > 0) {
          stats.mastery--;
          stats.freePoints++;
        }
        break;
      case StatsType.luck:
        if (stats.luck > 0) {
          stats.luck--;
          stats.freePoints++;
        }
        break;
      default:
        throw ArgumentError('Invalid type: $type');
    }
  }
}
