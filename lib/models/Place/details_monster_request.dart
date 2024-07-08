class DetailsMonsterRequest {
  String place;
  int id;

  DetailsMonsterRequest({
    required this.place,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'place': place,
      'id': id,
    };
  }
}
