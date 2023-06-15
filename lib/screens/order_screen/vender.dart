import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class VenderScreen extends StatefulWidget {
  const VenderScreen({super.key});

  @override
  State<VenderScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<VenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(4.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back),
                    Padding(
                      padding:  EdgeInsets.only(right: 150),
                      child: Text(
                        'Vender',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
             Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.only(left: 15,top: 10,bottom: 10,right: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage('assets/images/home.jpeg'),
                    ),
                    Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Text('text',style: TextStyle(fontWeight: FontWeight.bold),),
                    )
                  ],

                ),
              ),
            ),
             Padding(
               padding:  EdgeInsets.only(top: 30),
               child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.only(left: 15,top: 10,bottom: 10,right: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/images/home.jpeg'),
                      ),
                      
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text('text',style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('text',style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      
                    ],
             
                  ),
                ),
                         ),
             ),
            ],
          ),
        ),
      ),
    );
  }
}
