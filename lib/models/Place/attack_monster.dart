import 'package:freezed_annotation/freezed_annotation.dart';

part 'attack_monster.freezed.dart';
part 'attack_monster.g.dart';

@freezed
class AttackMonster with _$AttackMonster {
  const factory AttackMonster({
    required int idMonster,
    required int type,
    required String name,
    required String place,
  }) = _AttackMonster;

  factory AttackMonster.fromJson(Map<String, dynamic> json) =>
      _$AttackMonsterFromJson(json);
}
