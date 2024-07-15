import 'package:client/models/item.dart';

class EquipmentResponse {
  Item? head;
  Item? body;
  Item? feet;
  Item? weapon;

  EquipmentResponse({
    required this.head,
    required this.body,
    required this.feet,
    required this.weapon,
  });

  factory EquipmentResponse.fromJson(Map<String, dynamic> json) {
    return EquipmentResponse(
      head: json['head'] != null ? Item.fromJson(json['head']) : null,
      body: json['body'] != null ? Item.fromJson(json['body']) : null,
      feet: json['feet'] != null ? Item.fromJson(json['feet']) : null,
      weapon: json['weapon'] != null ? Item.fromJson(json['weapon']) : null,
    );
  }
}
