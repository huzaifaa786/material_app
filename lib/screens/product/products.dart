// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:material/api/material.dart';
import 'package:material/model/product.dart';
import 'package:material/model/vendor.dart';
import 'package:material/screens/cart/cart.dart';
import 'package:material/screens/order/order.dart';
import 'package:material/static/product_card.dart';
import 'package:material/static/search_field.dart';
import 'package:material/values/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.id, this.vendor});
  final int? id;
  final VendorModel? vendor;

  @override
  State<ProductScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProductScreen> {
  List<Product> products = [];
  List<Product> sproducts = [];
  String CartQty = "0";

  void searchOrders(String query) {
    setState(() {
      if (query == '') {
        sproducts = products;
      } else {
        sproducts = products
            .where((o) =>
                o.name!.toString().contains(query.toLowerCase()) ||
                o.vendorName!.toLowerCase().contains(query.toLowerCase()) ||
                o.id!.toString().contains(query.toLowerCase()) ||
                o.unit!.toLowerCase().contains(query.toLowerCase()) ||
                o.phone!.toLowerCase().contains(query.toLowerCase()) ||
                o.price!.toLowerCase().contains(query.toLowerCase()) ||
                o.description!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  getproducts() async {
    var mproduct = await MaterialApi.getProduct(widget.id);
    setState(() {
      products = mproduct;
      sproducts = products;
    });
  }

  getCartItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var items = await prefs.getString('carts');
    if (items != null) {
      List<dynamic> carts = jsonDecode(items);
      if (carts.length > 0) {
        CartQty = carts.length.toString();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getproducts();
    });
    getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose product'),
        backgroundColor: mainColor,
        centerTitle: true,
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CartScreen()));
            },
            child: Stack(
              children: <Widget>[
                new IconButton(
                  icon: new Icon(
                    Icons.trolley,
                    color: Colors.white,
                  ),
                  onPressed: null,
                ),
                new Positioned(
                    child: new Stack(
                  children: <Widget>[
                    new Icon(Icons.brightness_1,
                        size: 20.0, color: Colors.green[800]),
                    new Positioned(
                        top: 4.0,
                        right: 6.0,
                        child: new Center(
                          child: new Text(
                            CartQty,
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 11.0,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ],
                )),
              ],
            ),
          ),
        ],
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_circle_left_outlined)),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 24),
              child: Column(
                children: [
                  sproducts.isNotEmpty
                      ? Flexible(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.85,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: sproducts.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ProductCard(
                                  title: sproducts[index].name,
                                  image: sproducts[index].image1,
                                  price: sproducts[index].price.toString(),
                                  ontap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                OrderCheckOutScreen(
                                                  product: sproducts[index],
                                                  vendor: widget.vendor!,
                                                )));
                                  },
                                );
                              },
                            ),
                          ),
                        )
                      : Flexible(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: Center(child: Text('No! Product found.')),
                          ),
                        ),
                ],
              ),
            ),
  
          ],
        ),
      ),
    );
  }
}
