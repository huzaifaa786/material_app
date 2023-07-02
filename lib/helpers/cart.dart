import 'dart:convert';

import 'package:material/model/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart {
  List<CartItem> items = [];

  Future<void> addItem(CartItem item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    items.add(item);
    await prefs.setStringList(
        'cartItems', items.map((item) => item.id.toString()).toList());
    // prefs.setString('item_${item.id}_id', item.toString());
    prefs.setString('item_${item.id}_name', item.name!);
    prefs.setString('item_${item.id}_price', item.price!);
    prefs.setString('item_${item.id}_phone', item.phone!);
    prefs.setString('item_${item.id}_vendor_id', item.vendor_id.toString());
  }

  Future<void> removeItem(CartItem item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    items.remove(item);
    await prefs.setStringList(
        'cartItems', items.map((item) => item.id.toString()).toList());
  }

  Future<List<CartItem>> getItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> itemIds = prefs.getStringList('cartItems')!;
    items = await _getCartItemsFromPrefs(itemIds);
    return items;
  }

  Future<List<CartItem>> _getCartItemsFromPrefs(List<String> itemIds) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<CartItem> cartItems = [];

    for (String id in itemIds) {
      String? itemName = prefs.getString('item_${id}_name');
      String? itemPrice = prefs.getString('item_${id}_price');
      String? itemId = prefs.getString('item_${id}_id');
      String? itemphone = prefs.getString('item_${id}_phone');
      String? itemVID = prefs.getString('item_${id}_vendor_id');
      print('$itemName $itemId $itemVID');

      if (itemName != null && itemPrice != null) {
        CartItem item = CartItem(
          id: int.parse(itemId.toString()),
          vendor_id: int.parse(itemVID.toString()),
          name: itemName,
          price: itemPrice.toString(),
          phone: itemphone,
        );
        cartItems.add(item);
        print(cartItems);
      }
    }

    return cartItems;
  }

  // Future<void> saveCartItem(CartItem? item) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(item!.id.toString(), json.encode(item));
  // }

  // Future<void> removeCartItem(String itemId) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.remove(itemId);
  // }
}
