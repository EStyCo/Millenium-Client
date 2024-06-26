import 'package:client/bloc/action_screen/action_screen_event.dart';
import 'package:client/models/Request/travel_request.dart';
import 'package:client/services/local/user_storage.dart';
import 'package:client/services/web/travel_service.dart';
import 'package:get_it/get_it.dart';

class RouteService {
  final storage = GetIt.I<UserStorage>();


  Future<bool> goNewPlace(ActionEvent event) async {
    var response = await TravelService().goNewPlace(
      TravelRequest(name: storage.character.name, place: event.place),
    );
    if (response.isSuccess) {
      storage.character.place = event.place;
      return true;
    } else {
      return false;
    }
  }

  ActionEvent getActionEvent(String place) {
    switch (place) {
      case 'town':
        return TownScreenEvent();
      case 'glade':
        return GladeScreenEvent();
      case 'darkwood':
        return DarkWoodScreenEvent();
      case 'spellMaster':
        return MentorScreenEvent();
      default:
        return TownScreenEvent();
    }
  }
  
  // Future<ActionEvent> getEventPlace() async {
  //   var response = await TravelService()
  //       .getPlace(NameRequest(name: storage.character.name));

  //   if (response.isSuccess && response.result!.isEmpty) {
  //     final TravelRequest travelResponse =
  //         TravelRequest.fromJson(response.result?['travelDTO']);
  //     return getActionEvent(travelResponse.place);
  //   } else {
  //     return TownScreenEvent();
  //   }
  // }

  // ActionScreenState getActionState(String place) {
  //   switch (place) {
  //     case 'town':
  //       return const TownScreenState();
  //     case 'glade':
  //       return const GladeScreenState();
  //     case 'spellMaster':
  //       return const MentorScreenState();
  //     default:
  //       return const TownScreenState();
  //   }
  // }
}
