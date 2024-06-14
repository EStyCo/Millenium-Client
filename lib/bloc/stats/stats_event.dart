import 'package:client/models/Utilities/stats_type.dart';

abstract class StatsEvent {}

class SaveStatsEvent extends StatsEvent {}

class GetStatsEvent extends StatsEvent {}

class AddStatsEvent extends StatsEvent {
  AddStatsEvent({required this.type});
  final StatsType type;
}

class ReduceStatsEvent extends StatsEvent {
  ReduceStatsEvent({required this.type});
  final StatsType type;
}
