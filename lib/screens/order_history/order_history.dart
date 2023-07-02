// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:material/api/order.dart';
import 'package:material/model/order.dart';
import 'package:material/values/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  List<Order> orderHistory = [];

  getorders() async {
    var morders = await OrderApi.getOrders();
    setState(() {
      orderHistory = morders;
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getorders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
        backgroundColor: mainColor,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_circle_left_outlined)),
      ),
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(4.0),
        child: Column(
          children: [
            orderHistory.isNotEmpty
                ? Flexible(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.85,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: orderHistory.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.white,
                            elevation: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(bottom: 2, top: 10),
                                        child: Text(
                                          'Order No #'+ orderHistory[index].id.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(bottom: 2),
                                        child: Text(orderHistory[index].name!),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Center(
                                            child: Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 2, top: 20),
                                          child: Text(
                                            orderHistory[index].phone!,
                                            maxLines: null,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      )),
    );
  }
}
