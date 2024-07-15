class Item {
  int id;
  int slotType;
  int itemType;
  String name;
  String description;
  String imagePath;
  bool canEquipped;
  bool isEquipped;

  Item({
    required this.id,
    required this.slotType,
    required this.itemType,
    required this.name,
    required this.description,
    required this.imagePath,
    required this.canEquipped,
    required this.isEquipped,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] as int,
      slotType: json['slotType'] as int,
      itemType: json['itemType'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      imagePath: json['imagePath'] as String,
      canEquipped: json['canEquipped'] as bool,
      isEquipped: json['isEquipped'] as bool,
    );
  }
}
