import 'dart:convert';
import 'package:client/models/LoginPage/AuthRequest/login_request.dart';
import 'package:client/models/LoginPage/AuthRequest/reg_request.dart';
import 'package:client/models/Response/api_response.dart';
import 'package:client/models/Utilities/base_url.dart';
import 'package:client/services/web/base_service.dart';

class AuthService extends BaseService {
  String route = '/auth';

  Future<APIResponse> loginAsync(LoginRequest request) {
    return sendAsync(APIRequest(
      apiType: ApiType.POST,
      data: jsonEncode(request.toJson()),
      url: '${BaseUrl.Get()}$route/login',
    ));
  }

  Future registerAsync(RegRequest request) {
    return sendAsync(APIRequest(
      apiType: ApiType.POST,
      data: jsonEncode(request.toJson()),
      url: '${BaseUrl.Get()}$route/reg',
    ));
  }
}
