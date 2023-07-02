// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  const CartCard(
      {super.key, this.image, this.title, this.ontap, this.price});
  final image;
  final title;
  final ontap;
  final price;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // image != null
                //     ? CircleAvatar(
                //         radius: 30,
                //         backgroundColor: Colors.white,
                //         backgroundImage: NetworkImage(image),
                //       )
                //     : CircleAvatar(
                //         radius: 30,
                //         backgroundColor: Colors.white,
                //         backgroundImage: NetworkImage(
                //             'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/300px-No_image_available.svg.png'),
                //         foregroundImage: NetworkImage(
                //             'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/300px-No_image_available.svg.png'),
                //       ),
                SizedBox(
                  width: MediaQuery.of(context).size.width *0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'Product Name: ' + title,
                          maxLines: null,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'Price: Rs.' + price,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Text('x 1')
          ],
        ),
      ),
    );
  }
}
