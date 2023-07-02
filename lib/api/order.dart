// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material/api/api.dart';
import 'package:material/helpers/loading.dart';
import 'package:material/model/cart.dart';
import 'package:material/model/order.dart';
import 'package:material/model/product.dart';
import 'package:material/model/vendor.dart';
import 'package:material/values/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderApi {
  static placeOrder(name, phone, address) async {
    LoadingHelper.show();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<CartItem> items = [];
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

    var vendor_id = items.first.vendor_id;
    var url = BASE_URL + 'order/create';
    var api_token = await prefs.getString('api_token');

    var data = {
      'api_token': api_token,
      'vendor_id': vendor_id,
      'items': cartItems,
      'name': name,
      'phone': phone,
      'address': address
    };
    var response = await Api.execute(url: url, data: data);
    LoadingHelper.dismiss();
    Fluttertoast.showToast(
        msg: "Products Ordered Successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    return response['order'];
  }

  static getOrders() async {
    LoadingHelper.show();
    var url = BASE_URL + 'order/history';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var api_token = await prefs.getString('api_token');

    var data = {
      'api_token': api_token,
    };
    var response = await Api.execute(url: url, data: data);
    List<Order> orders = <Order>[];
    for (var order in response['orders']) {
      orders.add(Order(order));
    }
    LoadingHelper.dismiss();
    return orders;
  }
}
