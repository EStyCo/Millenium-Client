class State {
  String name;
  String description;
  String imagePath;
  int time;

  State({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.time,
  });

  factory State.fromJson(Map<String, dynamic> json) {
    return State(
      name: json['name'] as String,
      description: json['description'] as String,
      imagePath: json['imagePath'] as String,
      time: json['time'] as int,
    );
  }
}
