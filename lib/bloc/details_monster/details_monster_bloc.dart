import 'package:client/bloc/details_monster/details_monster_state.dart';
import 'package:client/services/handlers/battle_place_handler.dart';
import 'package:client/services/local/user_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class DetailsMonsterBloc extends Bloc<int, DetailsMonsterState> {
  final storage = GetIt.I<UserStorage>();
  final handler = GetIt.I<BattlePlaceHandler>();

  DetailsMonsterBloc() : super(LoadingDetailsState()) {
    on<int>(
      (event, emit) async {
        emit(LoadingDetailsState());
        var details = await handler.getDetailsMonster(event);
        if (details == null) {
          emit(const DeniedLoadedDetailsState());
        } else {
          emit(LoadedDetailsState(details: details));
        }
      },
    );
  }
}
