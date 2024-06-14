import 'dart:convert';
import 'package:client/models/Place/attack_monster.dart';
import 'package:client/models/Place/place.dart';
import 'package:client/models/Response/api_response.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/services/web/base_service.dart';

class MonsterService extends BaseService {
  String route = '/monster';

  Future<APIResponse> getMonsters(Place dto) {
    return sendAsync(APIRequest(
      apiType: ApiType.POST,
      data: jsonEncode(dto.toJson()),
      url: '${BaseUrl.Get()}$route/getMonsters',
    ));
  }

  Future<APIResponse> attackMonster(AttackMonster dto) {
    return sendAsync(APIRequest(
      apiType: ApiType.POST,
      data: jsonEncode(dto.toJson()),
      url: '${BaseUrl.Get()}$route/attack',
    ));
  }

  Future<APIResponse> addMonster(Place dto) {
    return sendAsync(APIRequest(
      apiType: ApiType.POST,
      data: jsonEncode(dto.toJson()),
      url: '${BaseUrl.Get()}$route/add',
    ));
  }
}
