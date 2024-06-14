import 'package:client/bloc/action_screen/action_screen_state.dart';

abstract class ActionEvent {
  String get place;
  ActionScreenState get state;
}

abstract class ActionModalScreenEvent extends ActionEvent {}
abstract class ActionScreenEvent extends ActionEvent {}

class TownScreenEvent extends ActionScreenEvent {
  @override
  String get place => 'town';
  @override
  ActionScreenState get state => const TownScreenState();
}

class GladeScreenEvent extends ActionScreenEvent {
  @override
  String get place => 'glade';
  @override
  ActionScreenState get state => const GladeScreenState();
}

class MentorScreenEvent extends ActionModalScreenEvent {
  @override
  String get place => 'spellMaster';
  @override
  ActionScreenState get state => const MentorScreenState();
}
