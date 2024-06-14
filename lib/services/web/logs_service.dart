import 'dart:convert';

import 'package:client/models/Request/name_request.dart';
import 'package:client/models/Response/api_response.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/services/web/base_service.dart';

class LogsService extends BaseService {
  String route = '/logs';

  Future<APIResponse> getListLogs(NameRequest dto) {
    return sendAsync(APIRequest(
      apiType: ApiType.POST,
      data: jsonEncode(dto.toJson()),
      url: '${BaseUrl.Get()}$route/get',
    ));
  }
}
