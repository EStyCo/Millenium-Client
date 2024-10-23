class Item {
  int id;
  int slotType;
  int itemType;
  String name;
  String description;
  String gainsDescription;
  String imagePath;
  bool canEquipped;
  bool isEquipped;
  int? damage;

  Item({
    required this.id,
    required this.slotType,
    required this.itemType,
    required this.name,
    required this.description,
    required this.gainsDescription,
    required this.imagePath,
    required this.canEquipped,
    required this.isEquipped,
    required this.damage,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        id: json['id'] as int,
        slotType: json['slotType'] as int,
        itemType: json['itemType'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
        gainsDescription: json['gainsDescription'] as String,
        imagePath: json['imagePath'] as String,
        canEquipped: json['canEquipped'] as bool,
        isEquipped: json['isEquipped'] as bool,
        damage: json['damage'] as int?);
  }
}
