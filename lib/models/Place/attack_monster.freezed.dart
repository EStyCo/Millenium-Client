// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attack_monster.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttackMonster _$AttackMonsterFromJson(Map<String, dynamic> json) {
  return _AttackMonster.fromJson(json);
}

/// @nodoc
mixin _$AttackMonster {
  int get idMonster => throw _privateConstructorUsedError;
  int get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get place => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttackMonsterCopyWith<AttackMonster> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttackMonsterCopyWith<$Res> {
  factory $AttackMonsterCopyWith(
          AttackMonster value, $Res Function(AttackMonster) then) =
      _$AttackMonsterCopyWithImpl<$Res, AttackMonster>;
  @useResult
  $Res call({int idMonster, int type, String name, String place});
}

/// @nodoc
class _$AttackMonsterCopyWithImpl<$Res, $Val extends AttackMonster>
    implements $AttackMonsterCopyWith<$Res> {
  _$AttackMonsterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMonster = null,
    Object? type = null,
    Object? name = null,
    Object? place = null,
  }) {
    return _then(_value.copyWith(
      idMonster: null == idMonster
          ? _value.idMonster
          : idMonster // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttackMonsterImplCopyWith<$Res>
    implements $AttackMonsterCopyWith<$Res> {
  factory _$$AttackMonsterImplCopyWith(
          _$AttackMonsterImpl value, $Res Function(_$AttackMonsterImpl) then) =
      __$$AttackMonsterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int idMonster, int type, String name, String place});
}

/// @nodoc
class __$$AttackMonsterImplCopyWithImpl<$Res>
    extends _$AttackMonsterCopyWithImpl<$Res, _$AttackMonsterImpl>
    implements _$$AttackMonsterImplCopyWith<$Res> {
  __$$AttackMonsterImplCopyWithImpl(
      _$AttackMonsterImpl _value, $Res Function(_$AttackMonsterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idMonster = null,
    Object? type = null,
    Object? name = null,
    Object? place = null,
  }) {
    return _then(_$AttackMonsterImpl(
      idMonster: null == idMonster
          ? _value.idMonster
          : idMonster // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttackMonsterImpl implements _AttackMonster {
  const _$AttackMonsterImpl(
      {required this.idMonster,
      required this.type,
      required this.name,
      required this.place});

  factory _$AttackMonsterImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttackMonsterImplFromJson(json);

  @override
  final int idMonster;
  @override
  final int type;
  @override
  final String name;
  @override
  final String place;

  @override
  String toString() {
    return 'AttackMonster(idMonster: $idMonster, type: $type, name: $name, place: $place)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttackMonsterImpl &&
            (identical(other.idMonster, idMonster) ||
                other.idMonster == idMonster) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.place, place) || other.place == place));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idMonster, type, name, place);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttackMonsterImplCopyWith<_$AttackMonsterImpl> get copyWith =>
      __$$AttackMonsterImplCopyWithImpl<_$AttackMonsterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttackMonsterImplToJson(
      this,
    );
  }
}

abstract class _AttackMonster implements AttackMonster {
  const factory _AttackMonster(
      {required final int idMonster,
      required final int type,
      required final String name,
      required final String place}) = _$AttackMonsterImpl;

  factory _AttackMonster.fromJson(Map<String, dynamic> json) =
      _$AttackMonsterImpl.fromJson;

  @override
  int get idMonster;
  @override
  int get type;
  @override
  String get name;
  @override
  String get place;
  @override
  @JsonKey(ignore: true)
  _$$AttackMonsterImplCopyWith<_$AttackMonsterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
