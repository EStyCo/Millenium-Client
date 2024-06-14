// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

APIResponse _$APIResponseFromJson(Map<String, dynamic> json) {
  return _Response.fromJson(json);
}

/// @nodoc
mixin _$APIResponse {
  int get statusCode => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  List<String> get errorMessages => throw _privateConstructorUsedError;
  Map<String, dynamic>? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $APIResponseCopyWith<APIResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $APIResponseCopyWith<$Res> {
  factory $APIResponseCopyWith(
          APIResponse value, $Res Function(APIResponse) then) =
      _$APIResponseCopyWithImpl<$Res, APIResponse>;
  @useResult
  $Res call(
      {int statusCode,
      bool isSuccess,
      List<String> errorMessages,
      Map<String, dynamic>? result});
}

/// @nodoc
class _$APIResponseCopyWithImpl<$Res, $Val extends APIResponse>
    implements $APIResponseCopyWith<$Res> {
  _$APIResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? isSuccess = null,
    Object? errorMessages = null,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessages: null == errorMessages
          ? _value.errorMessages
          : errorMessages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseImplCopyWith<$Res>
    implements $APIResponseCopyWith<$Res> {
  factory _$$ResponseImplCopyWith(
          _$ResponseImpl value, $Res Function(_$ResponseImpl) then) =
      __$$ResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int statusCode,
      bool isSuccess,
      List<String> errorMessages,
      Map<String, dynamic>? result});
}

/// @nodoc
class __$$ResponseImplCopyWithImpl<$Res>
    extends _$APIResponseCopyWithImpl<$Res, _$ResponseImpl>
    implements _$$ResponseImplCopyWith<$Res> {
  __$$ResponseImplCopyWithImpl(
      _$ResponseImpl _value, $Res Function(_$ResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? isSuccess = null,
    Object? errorMessages = null,
    Object? result = freezed,
  }) {
    return _then(_$ResponseImpl(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessages: null == errorMessages
          ? _value._errorMessages
          : errorMessages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      result: freezed == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ResponseImpl implements _Response {
  const _$ResponseImpl(
      {required this.statusCode,
      required this.isSuccess,
      required final List<String> errorMessages,
      required final Map<String, dynamic>? result})
      : _errorMessages = errorMessages,
        _result = result;

  factory _$ResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseImplFromJson(json);

  @override
  final int statusCode;
  @override
  final bool isSuccess;
  final List<String> _errorMessages;
  @override
  List<String> get errorMessages {
    if (_errorMessages is EqualUnmodifiableListView) return _errorMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_errorMessages);
  }

  final Map<String, dynamic>? _result;
  @override
  Map<String, dynamic>? get result {
    final value = _result;
    if (value == null) return null;
    if (_result is EqualUnmodifiableMapView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'APIResponse(statusCode: $statusCode, isSuccess: $isSuccess, errorMessages: $errorMessages, result: $result)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            const DeepCollectionEquality()
                .equals(other._errorMessages, _errorMessages) &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      statusCode,
      isSuccess,
      const DeepCollectionEquality().hash(_errorMessages),
      const DeepCollectionEquality().hash(_result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseImplCopyWith<_$ResponseImpl> get copyWith =>
      __$$ResponseImplCopyWithImpl<_$ResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseImplToJson(
      this,
    );
  }
}

abstract class _Response implements APIResponse {
  const factory _Response(
      {required final int statusCode,
      required final bool isSuccess,
      required final List<String> errorMessages,
      required final Map<String, dynamic>? result}) = _$ResponseImpl;

  factory _Response.fromJson(Map<String, dynamic> json) =
      _$ResponseImpl.fromJson;

  @override
  int get statusCode;
  @override
  bool get isSuccess;
  @override
  List<String> get errorMessages;
  @override
  Map<String, dynamic>? get result;
  @override
  @JsonKey(ignore: true)
  _$$ResponseImplCopyWith<_$ResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
