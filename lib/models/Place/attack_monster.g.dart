// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attack_monster.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttackMonsterImpl _$$AttackMonsterImplFromJson(Map<String, dynamic> json) =>
    _$AttackMonsterImpl(
      idMonster: json['idMonster'] as int,
      type: json['type'] as int,
      name: json['name'] as String,
      place: json['place'] as String,
    );

Map<String, dynamic> _$$AttackMonsterImplToJson(_$AttackMonsterImpl instance) =>
    <String, dynamic>{
      'idMonster': instance.idMonster,
      'type': instance.type,
      'name': instance.name,
      'place': instance.place,
    };
