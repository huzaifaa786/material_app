// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:flutter/material.dart';

// class OrderScreen extends StatefulWidget {
//   const OrderScreen({super.key});

//   @override
//   State<OrderScreen> createState() => _OrderScreenState();
// }

// class _OrderScreenState extends State<OrderScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Container(
//         margin: EdgeInsets.all(4.0),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(bottom: 40),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Icon(Icons.arrow_back),
//                   Text(
//                     'History',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                   )
//                 ],
//               ),
//             ),
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
//               color: Colors.white,
//               elevation: 10,
//               child: Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CircleAvatar(
//                           radius: 30,
//                           backgroundImage:
//                               AssetImage('assets/images/home.jpeg'),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(bottom: 2, top: 10),
//                           child: Text(
//                             'Order No# 495-909334',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         Padding(
//                           padding: EdgeInsets.only(bottom: 2),
//                           child: Text('Thomas Williain'),
//                         ),
//                       ],
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(left: 20),
//                           child: Center(
//                               child: Padding(
//                             padding: EdgeInsets.only(bottom: 2, top: 20),
//                             child: Text(
//                               'Pk 50',
//                               maxLines: null,
//                               textAlign: TextAlign.center,
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                           )),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       )),
//     );
//   }
// }
