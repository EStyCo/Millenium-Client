class ConnectToPlaceHub {
  final String name;
  final String place;
  ConnectToPlaceHub({required this.name, required this.place});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'place': place,
    };
  }
}