import 'package:flutter/material.dart';
import 'package:material/helpers/cart.dart';
import 'package:material/model/cart.dart';
import 'package:material/screens/checkout/checkout.dart';
import 'package:material/static/cart_card.dart';
import 'package:material/static/product_card.dart';
import 'package:material/values/colors.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> items = [];
  final cart = new Cart();

  getCartItems() async {
    items = await cart.getCartItems();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getCartItems();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Products'),
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
                  items.isNotEmpty
                      ? Flexible(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.85,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: items.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CartCard(
                                  title: items[index].name,
                                  image: items[index].image1,
                                  price: items[index].price.toString(),
                                  ontap: () {},
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
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    child: Text(
                      'Proceed to checkout',
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
                      if (items.isNotEmpty) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CheckOutScreen()));
                      }else{
                        
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
