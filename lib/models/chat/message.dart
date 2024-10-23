class Message {
  String time;
  String name;
  String data;

  Message({required this.time, required this.name, required this.data});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      time: json['time'] as String,
      name: json['name'] as String,
      data: json['data'] as String,
    );
  }
}
