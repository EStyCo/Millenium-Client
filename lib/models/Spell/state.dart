class  State {
  String name;
  String description;
  String imagePath;

  State({
    required this.name,
    required this.description,
    required this.imagePath,
  });

  factory State.fromJson(Map<String, dynamic> json) {
    return State(
      name: json['name'] as String,
      description: json['description'] as String,
      imagePath: json['imagePath'] as String,
    );
  }
}
