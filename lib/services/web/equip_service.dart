import 'package:client/models/Request/dressing_request.dart';
import 'package:client/models/Response/api_response.dart';
import 'package:client/models/Request/name_request.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/services/web/base_service.dart';
import 'dart:convert';

class EquipService extends BaseService {
  String route = '/inventory';

  Future<APIResponse> getInventory(NameRequest request) {
    return sendAsync(
      APIRequest(
        apiType: ApiType.POST,
        data: jsonEncode(request.toJson()),
        url: '${BaseUrl.Get()}$route/getInventory',
      ),
    );
  }

  Future getEquip(NameRequest request) {
    return sendAsync(
      APIRequest(
        apiType: ApiType.POST,
        data: jsonEncode(request.toJson()),
        url: '${BaseUrl.Get()}$route/getEquip',
      ),
    );
  }

  Future<APIResponse> equipItem(DressingRequest request) {
    return sendAsync(
      APIRequest(
        apiType: ApiType.PUT,
        data: jsonEncode(request.toJson()),
        url: '${BaseUrl.Get()}$route/equipItem',
      ),
    );
  }

  Future<APIResponse> unEquipItem(DressingRequest request) {
    return sendAsync(
      APIRequest(
        apiType: ApiType.PUT,
        data: jsonEncode(request.toJson()),
        url: '${BaseUrl.Get()}$route/unEquipItem',
      ),
    );
  }
}
