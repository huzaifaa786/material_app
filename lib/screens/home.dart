import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.all(4.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back),
                  Text(
                    'History',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Icon(Icons.access_alarm_outlined)
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding:  EdgeInsets.only(left: 10,bottom: 5),
                  child: Text(
                    'Materials:',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                  ),
                )
              ],
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
                padding:  EdgeInsets.only(top: 20),
                child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.white,
                elevation: 10,
                child: Padding(
                  padding:  EdgeInsets.only(left: 15,top: 10,bottom: 10,right: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/images/home.jpeg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('text',style: TextStyle(fontWeight: FontWeight.bold),),
                      )
                    ],
              
                  ),
                ),
                          ),
              ),
          ],
        ),
      )),
    );
  }
}
