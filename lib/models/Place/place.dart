class Place {
  String place;
  Place({required this.place});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      place: json['place'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'place': place,
    };
  }
}
