// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:material/helpers/cart.dart';
import 'package:material/model/cart.dart';
import 'package:material/model/product.dart';
import 'package:material/model/vendor.dart';
import 'package:material/screens/product/products.dart';
import 'package:material/static/headingText.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:material/values/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderCheckOutScreen extends StatefulWidget {
  const OrderCheckOutScreen(
      {super.key, required this.product, required this.vendor});
  final Product product;
  final VendorModel vendor;

  @override
  State<OrderCheckOutScreen> createState() => _OrderCheckOutScreenState();
}

class _OrderCheckOutScreenState extends State<OrderCheckOutScreen> {
  // CartItem data = CartItem();

  int _current = 0;
  SharedPreferences? prefs;
  List<Product> productList = [];

  Future<void> _initializeSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    _initializeSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    final Cart cart = Cart();
    List<String> imgList = [
      widget.product.image1!,
      widget.product.image2!,
      widget.product.image3!,
    ];
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 200,
                            child: CarouselSlider(
                              options: CarouselOptions(
                                autoPlay: true,
                                viewportFraction: 1,
                                enlargeCenterPage: false,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                },
                              ),
                              items: imgList.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: i,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                          Positioned(
                              top: 10,
                              left: 10,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProductScreen(id: widget.vendor.id, vendor: widget.vendor,)));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(45),
                                      border: Border.all(color: Colors.grey)),
                                  child: Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 18,
                                  ),
                                ),
                              )),
                          Positioned(
                            bottom: 24,
                            right: 115,
                            child: CarouselIndicator(
                              count: imgList.length,
                              index: _current,
                              activeColor: Colors.white,
                              color: Colors.white60,
                              width: 40,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0, bottom: 20),
                      child: Row(
                        children: [
                          HeadingText(text: 'Owner Name: '),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              widget.vendor.name!,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black54),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          HeadingText(text: 'Price: '),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              'Rs ' + widget.product.price!,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black54),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        children: [
                          HeadingText(text: 'Unit: '),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              widget.product.unit!,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black54),
                            ),
                          )
                        ],
                      ),
                    ),
                    HeadingText(text: 'Discription'),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 18),
                      child: Text(
                        widget.product.description!,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: Colors.black54),
                      ),
                    ),
                    SizedBox(height: 40)
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    child: Text(
                      'Add To Cart',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      backgroundColor: mainColor,
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      var item = CartItem(
                          id: widget.product.id,
                          name: widget.product.name,
                          price: widget.product.price,
                          phone: widget.product.phone,
                          vendor_id: widget.product.vendor_id,
                          image1: widget.product
                              .image1); // Replace with your desired item properties
                      await cart.addItem(item);

                    
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
