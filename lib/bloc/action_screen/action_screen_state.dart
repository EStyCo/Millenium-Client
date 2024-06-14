import 'package:client/bloc/action_screen/action_screen_bloc.dart';
import 'package:client/pages/Screens/action/glade_screen.dart';
import 'package:client/pages/Screens/action/mentor_screen.dart';
import 'package:client/pages/Screens/action/town_screen.dart';
import 'package:client/services/local/route_service.dart';
import 'package:client/services/local/user_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

abstract class ActionScreenState extends StatelessWidget {
  const ActionScreenState({super.key});
}

class RedirectScreenState extends ActionScreenState {
  RedirectScreenState({super.key});
  final storage = GetIt.I<UserStorage>();

  @override
  Widget build(BuildContext context) {
    final ActionScreenBloc actionBloc =
        BlocProvider.of<ActionScreenBloc>(context);
    actionBloc.add(
      RouteService().getActionEvent(storage.character.place),
    );

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class TownScreenState extends ActionScreenState {
  const TownScreenState({super.key});
  @override
  Widget build(BuildContext context) {
    return const TownScreen();
  }
}

class GladeScreenState extends ActionScreenState {
  const GladeScreenState({super.key});
  @override
  Widget build(BuildContext context) {
    return GladeScreen();
  }
}

class MentorScreenState extends ActionScreenState {
  const MentorScreenState({super.key});
  @override
  Widget build(BuildContext context) {
    return MentorScreen();
  }
}