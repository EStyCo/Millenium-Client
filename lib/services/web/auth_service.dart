import 'dart:convert';
import 'package:client/models/LoginPage/LoginRequest/login_request.dart';
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

  Future registerAsync(dynamic registerData) {
    return sendAsync(APIRequest(
      apiType: ApiType.POST,
      data: registerData,
      url: 'http://yourapi.com/auth/reg',
    ));
  }
}
