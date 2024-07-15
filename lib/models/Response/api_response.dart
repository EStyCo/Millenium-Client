class APIResponse {
  int statusCode;
  bool isSuccess;
  List<String> errorMessages;
  Map<String, dynamic>? result;

  APIResponse(
      {required this.statusCode,
      required this.isSuccess,
      required this.errorMessages,
      required this.result});

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    return APIResponse(
      statusCode: json['statusCode'] as int,
      isSuccess: json['isSuccess'] as bool,
      errorMessages: (json['errorMessages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      result: json['result'] as Map<String, dynamic>?,
    );
  }
}
