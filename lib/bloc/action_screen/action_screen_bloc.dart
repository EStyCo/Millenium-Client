import 'package:client/bloc/action_screen/action_screen_event.dart';
import 'package:client/bloc/action_screen/action_screen_state.dart';
import 'package:client/services/handlers/battle_place_handler.dart';
import 'package:client/services/local/route_service.dart';
import 'package:client/services/local/user_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ActionScreenBloc extends Bloc<ActionEvent, ActionScreenState> {
  final storage = GetIt.I<UserStorage>();
  final handler = GetIt.I<BattlePlaceHandler>();

  ActionScreenBloc() : super(RedirectScreenState()) {
    on<ActionScreenEvent>((event, emit) async {
      if (await RouteService().goNewPlace(event)) {
        await handler.stopConnection();
        await handler.initializeSignalR(event.place);
        emit(event.state);
      }
    });
    // on<SpecialScreenEvent>((event, emit) async {
    //   if (await RouteService().goNewPlace(event)) {
    //     await handler.stopConnection();
    //     await handler.initializeSignalR(event.place);
    //     emit(event.state);
    //   }
    // });
    on<ActionModalScreenEvent>((event, emit) async {
      emit(event.state);
    });
  }
}
