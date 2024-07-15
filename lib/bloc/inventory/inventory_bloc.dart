import 'package:client/bloc/inventory/inventory_event.dart';
import 'package:client/bloc/inventory/inventory_state.dart';
import 'package:client/models/Request/name_request.dart';
import 'package:client/models/Response/inventory_response.dart';
import 'package:client/services/handlers/battle_place_handler.dart';
import 'package:client/services/local/user_storage.dart';
import 'package:client/services/web/equip_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  final storage = GetIt.I<UserStorage>();
  final handler = GetIt.I<BattlePlaceHandler>();

  InventoryBloc() : super(const LoadingInventoryState()) {
    on<GetInventoryEvent>((event, emit) async {
      var response = await EquipService().getInventory(
        NameRequest(name: storage.character.name),
      );
      emit(LoadingInventoryState());
      if (response.isSuccess) {
        var inventory = InventoryResponse.fromJson(response.result!);
        if (inventory.items.isNotEmpty) {
          emit(LoadedInventoryState(
            items: inventory.items,
          ));
        } else {
          emit(EmptyInventoryState());
        }
      }
    });
  }
}
