import 'dart:convert';
import 'package:client/models/Request/name_request.dart';
import 'package:client/models/Request/update_stats_request.dart';
import 'package:client/models/Response/api_response.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/services/web/base_service.dart';

class StatsService extends BaseService {
  String route = '/stats';

  Future<APIResponse> getStats(NameRequest dto) {
    return sendAsync(APIRequest(
      apiType: ApiType.POST,
      data: jsonEncode(dto.toJson()),
      url: '${BaseUrl.Get()}$route/stats',
    ));
  }

  Future<APIResponse> updateStats(UpdateStatRequest dto) {
    return sendAsync(APIRequest(
      apiType: ApiType.PUT,
      data: jsonEncode(dto.toJson()),
      url: '${BaseUrl.Get()}$route/update',
    ));
  }

  Future<APIResponse> getStates(NameRequest dto) {
    return sendAsync(APIRequest(
      apiType: ApiType.POST,
      data: jsonEncode(dto.toJson()),
      url: '${BaseUrl.Get()}$route/states',
    ));
  }
}
