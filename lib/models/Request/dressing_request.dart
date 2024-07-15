class DressingRequest {
  String name;
  int id;
  DressingRequest({required this.name, required this.id});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'id': id,
    };
  }
}