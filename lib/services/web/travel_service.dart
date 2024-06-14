import 'dart:convert';
import 'package:client/models/Request/name_request.dart';
import 'package:client/models/Request/travel_request.dart';
import 'package:client/models/Response/api_response.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/services/web/base_service.dart';

class TravelService extends BaseService {
  String route = '/travel';

  Future<APIResponse> getPlace(NameRequest dto) {
    return sendAsync(APIRequest(
      apiType: ApiType.POST,
      data: jsonEncode(dto.toJson()),
      url: '${BaseUrl.Get()}$route/get',
    ));
  }

  Future<APIResponse> goNewPlace(TravelRequest dto) {
    return sendAsync(APIRequest(
      apiType: ApiType.POST,
      data: jsonEncode(dto.toJson()),
      url: '${BaseUrl.Get()}$route/go',
    ));
  }
}
