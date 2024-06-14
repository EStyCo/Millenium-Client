import 'dart:convert';
import 'package:client/models/Request/name_request.dart';
import 'package:client/models/Request/spell_request.dart';
import 'package:client/models/Response/api_response.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/services/web/base_service.dart';

class MentorService extends BaseService {
  String route = '/mentor';

  Future<APIResponse> getListSpells(NameRequest dto) {
    return sendAsync(APIRequest(
      apiType: ApiType.POST,
      data: jsonEncode(dto.toJson()),
      url: '${BaseUrl.Get()}$route/get',
    ));
  }

  Future<APIResponse> learnSpell(SpellRequest dto) {
    return sendAsync(APIRequest(
      apiType: ApiType.POST,
      data: jsonEncode(dto.toJson()),
      url: '${BaseUrl.Get()}$route/learn',
    ));
  }

  Future<APIResponse> forgotSpell(SpellRequest dto) {
    return sendAsync(APIRequest(
      apiType: ApiType.POST,
      data: jsonEncode(dto.toJson()),
      url: '${BaseUrl.Get()}$route/forgot',
    ));
  }
}
