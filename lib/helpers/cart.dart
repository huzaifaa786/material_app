import 'dart:convert';
import 'dart:developer';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material/model/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart {
  List<CartItem> items = [];

  Future<void> addItem(CartItem item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var cartItems = await prefs.getString('carts');
    if (cartItems != null) {
      for (var element in jsonDecode(cartItems)) {
        items.add(CartItem(
          id: element['id'],
          name: element['name'],
          price: element['price'],
          vendor_id: element['vendor_id'],
          phone: element['phone'],
          image1: element['image1'],
        ));
      }
    }
    var itemExist = null;
    if (items.isNotEmpty) {
      itemExist = await items.where((element) => element.id == item.id);
    }
    if (itemExist == null || itemExist.isEmpty) {
      items.add(item);
    }else{
       Fluttertoast.showToast(
        msg: "Product already in cart",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    }
    await prefs.setString('carts', jsonEncode(items));
    Fluttertoast.showToast(
        msg: "Product added to cart",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future<void> removeItem(CartItem item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    items.remove(item);
    await prefs.setStringList(
        'cartItems', items.map((item) => item.id.toString()).toList());
  }



  Future<List<CartItem>> getCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<CartItem> cartItems = [];
    var storedItems = await prefs.getString('carts');
    if (storedItems != null) {
      for (var element in jsonDecode(storedItems)) {
        cartItems.add(CartItem(
          id: element['id'],
          name: element['name'],
          price: element['price'],
          vendor_id: element['vendor_id'],
          phone: element['phone'],
          image1: element['image1'],
        ));
      }
    }
    print(cartItems);
    return cartItems;
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
