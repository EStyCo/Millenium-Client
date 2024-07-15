import 'package:client/models/item.dart';

class InventoryResponse {
  List<Item> items;
  InventoryResponse({required this.items});

  factory InventoryResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> listJson = json['items'];
    List<Item> itemList = listJson.map((itemJson) => Item.fromJson(itemJson)).toList();

    return InventoryResponse(
      items: itemList,
    );
  }
}
