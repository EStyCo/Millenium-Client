import 'dart:convert';
import 'package:client/models/Response/api_response.dart';
import 'package:http/http.dart' as http;

enum ApiType { GET, POST, PUT, DELETE }

class APIRequest {
  String url;
  dynamic data;
  ApiType apiType;

  APIRequest({required this.url, this.data, required this.apiType});
}

class BaseService {
  final httpClient = http.Client();

  Future<APIResponse> sendAsync(APIRequest apiRequest) async {
    var uri = Uri.parse(apiRequest.url);
    http.Response response;
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    try {
      switch (apiRequest.apiType) {
        case ApiType.POST:
          response = await httpClient.post(uri,
              headers: headers, body: apiRequest.data);
          break;
        case ApiType.PUT:
          response = await httpClient.put(uri,
              headers: headers, body: apiRequest.data);
          break;
        case ApiType.DELETE:
          response = await httpClient
              .delete(uri, headers: {'Accept': 'application/json'});
          break;
        case ApiType.GET:
        default:
          response = await httpClient
              .get(uri, headers: {'Accept': 'application/json'});
          break;
      }

      if (response.statusCode == 200) {
        return APIResponse.fromJson(json.decode(response.body));
      }

      print(response.body);
      
      return APIResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessages: [response.body],
          result: null);
    } catch (e) {
      return Future.error('Ошибка: ${e.toString()}');
    }
  }
}
