import 'dart:convert';
import 'package:client/models/Place/details_monster_request.dart';
import 'package:client/models/Place/place.dart';
import 'package:client/models/Response/api_response.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/services/web/base_service.dart';

class PlaceService extends BaseService {
  String route = '/place';

  // Future<APIResponse> getMonsters(Place dto) {
  //   return sendAsync(
  //     APIRequest(
  //       apiType: ApiType.POST,
  //       data: jsonEncode(dto.toJson()),
  //       url: '${BaseUrl.Get()}$route/getMonsters',
  //     ),
  //   );
  // }

  // Future<APIResponse> attackMonster(AttackMonster dto) {
  //   return sendAsync(
  //     APIRequest(
  //       apiType: ApiType.POST,
  //       data: jsonEncode(dto.toJson()),
  //       url: '${BaseUrl.Get()}$route/attackMonster',
  //     ),
  //   );
  // }

  // Future<APIResponse> attackUser(AttackUser dto) {
  //   return sendAsync(
  //     APIRequest(
  //       apiType: ApiType.POST,
  //       data: jsonEncode(dto.toJson()),
  //       url: '${BaseUrl.Get()}$route/attackUser',
  //     ),
  //   );
  // }

  Future<APIResponse> addMonster(Place dto) {
    return sendAsync(
      APIRequest(
        apiType: ApiType.POST,
        data: jsonEncode(dto.toJson()),
        url: '${BaseUrl.Get()}$route/add',
      ),
    );
  }

  Future<APIResponse> getDetailsMonster(DetailsMonsterRequest dto) {
    return sendAsync(
      APIRequest(
        apiType: ApiType.POST,
        data: jsonEncode(dto.toJson()),
        url: '${BaseUrl.Get()}$route/getDetailsMonster',
      ),
    );
  }
}
