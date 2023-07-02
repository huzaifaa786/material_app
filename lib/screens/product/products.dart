// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:material/api/material.dart';
import 'package:material/model/product.dart';
import 'package:material/model/vendor.dart';
import 'package:material/screens/order/order.dart';
import 'package:material/static/product_card.dart';
import 'package:material/static/search_field.dart';
import 'package:material/values/colors.dart';

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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getproducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose product'),
        backgroundColor: mainColor,
        centerTitle: true,
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
                      // await FlutterPhoneDirectCaller.callNumber(widget.vendor.phone!);

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
            Positioned(
              bottom: 30,
              child: Container(
                padding: EdgeInsets.only(right: 15, left: 15),
                width: MediaQuery.of(context).size.width,
                child: MSearchBar(
                  onChange: searchOrders,
                  imageIcon: 'assets/images/search.png',
                  hint: 'search',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
