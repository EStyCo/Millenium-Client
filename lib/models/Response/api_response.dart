import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@freezed
class APIResponse with _$APIResponse {
  @JsonSerializable(explicitToJson: true)
  const factory APIResponse({
    required int statusCode,
    required bool isSuccess,
    required List<String> errorMessages,
    required Map<String, dynamic>? result,
  }) = _Response;

  factory APIResponse.fromJson(Map<String, dynamic> json) =>
      _$APIResponseFromJson(json);
}
