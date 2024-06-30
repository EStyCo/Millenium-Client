import 'package:client/bloc/action_screen/action_screen_state.dart';

abstract class ActionEvent {
  String get name;
  String get place;
  ActionScreenState get state;
}

//БОЕВЫЕ ЛОКАЦИИ
abstract class ActionScreenEvent extends ActionEvent {}

class TownScreenEvent extends ActionScreenEvent {
  @override
  String get name => 'В город';
  @override
  String get place => 'town';
  @override
  ActionScreenState get state => const TownScreenState();
}

class GladeScreenEvent extends ActionScreenEvent {
  @override
  String get name => 'На поляну';
  @override
  String get place => 'glade';
  @override
  ActionScreenState get state => const GladeScreenState();
}

class DarkWoodScreenEvent extends ActionScreenEvent {
  @override
  String get name => 'К темному лесу';
  @override
  String get place => 'darkwood';
  @override
  ActionScreenState get state => const GladeScreenState();
}

//СПЕЦИАЛЬНЫЕ ЛОКАЦИИ
abstract class SpecialScreenEvent extends ActionEvent {}

class MasturbationScreenEvent extends SpecialScreenEvent {
  @override
  String get name => 'В дрочильню';
  @override
  String get place => 'masturbation';
  @override
  ActionScreenState get state => const MasturbationScreenState();
}

//МОДАЛЬНЫЕ ЛОКАЦИИ
abstract class ActionModalScreenEvent extends ActionEvent {}

class MentorScreenEvent extends ActionModalScreenEvent {
  @override
  String get name => 'Мастер';
  @override
  String get place => 'spellMaster';
  @override
  ActionScreenState get state => const MentorScreenState();
}
