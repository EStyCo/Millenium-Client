class BattleLog {
  String time;
  String data;
  BattleLog({required this.time, required this.data});

  factory BattleLog.fromJson(Map<String, dynamic> json) {
    return BattleLog(
      time: json['time'] as String,
      data: json['data'] as String,
    );
  }
}
