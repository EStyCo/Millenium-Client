// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseImpl _$$ResponseImplFromJson(Map<String, dynamic> json) =>
    _$ResponseImpl(
      statusCode: json['statusCode'] as int,
      isSuccess: json['isSuccess'] as bool,
      errorMessages: (json['errorMessages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      result: json['result'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ResponseImplToJson(_$ResponseImpl instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'isSuccess': instance.isSuccess,
      'errorMessages': instance.errorMessages,
      'result': instance.result,
    };
