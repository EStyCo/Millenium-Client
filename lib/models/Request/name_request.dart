class NameRequest {
  String name;
  NameRequest({required this.name});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}