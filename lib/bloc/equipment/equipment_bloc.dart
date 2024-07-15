import 'package:client/bloc/equipment/equipment_event.dart';
import 'package:client/bloc/equipment/equipment_state.dart';
import 'package:client/models/Request/name_request.dart';
import 'package:client/models/Response/equipment_response.dart';
import 'package:client/services/local/user_storage.dart';
import 'package:client/services/web/equip_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class EquipmentBloc extends Bloc<EquipmentEvent, EquipmentState> {
  final storage = GetIt.I<UserStorage>();

  EquipmentBloc() : super(EmptyEquipmentState()) {
    on<GetEquipmentEvent>((event, emit) async {
      var response = await EquipService().getEquip(
        NameRequest(name: storage.character.name),
      );
      
      if (response.isSuccess) {
        var equip = EquipmentResponse.fromJson(response.result!);
        emit(LoadedEquipmentState(equip: equip));
      }
    });
  }
}
