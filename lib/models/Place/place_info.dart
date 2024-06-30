class PlaceInfo {
  String imagePath;
  String description;
  bool canAttackUser;

  PlaceInfo({
    this.imagePath = 'default.png',
    this.description = '---',
    this.canAttackUser = false,
  });

  factory PlaceInfo.fromJson(Map<String, dynamic> json) {
    return PlaceInfo(
      imagePath: json['imagePath'] as String,
      description: json['description'] as String,
      canAttackUser: json['canAttackUser'] as bool,
    );
  }
}
