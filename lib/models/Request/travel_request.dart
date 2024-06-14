class TravelRequest {
  String name;
  String place;

  TravelRequest({required this.name, required this.place});
  Map<String, dynamic> toJson() {
    return {'name': name, 'place': place};
  }

  factory TravelRequest.fromJson(Map<String, dynamic> json) {
    return TravelRequest(
      name: json['name'] as String,
      place: json['place'] as String,
    );
  }
}
