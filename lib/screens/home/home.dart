// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material/api/auth.dart';
import 'package:material/api/material.dart';
import 'package:material/helpers/loading.dart';
import 'package:material/screens/auth/login.dart';
import 'package:material/screens/product/products.dart';
import 'package:material/static/material_card.dart';
import 'package:material/values/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  List<dynamic> materials = [];
  getmaterials() async {
    var mmaterials = await MaterialApi.getMaterial();
    setState(() {
      materials = mmaterials;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getmaterials();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Building Material'),
        backgroundColor: mainColor,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 15, right: 15, top: 24),
        child: Stack(
          children: [
            Container(
              // padding: EdgeInsets.only(left: 15, right: 15, top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 25),
                    child: Text(
                      'Choose Material Type: ',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                    ),
                  ),
                  materials.isNotEmpty
                      ? Flexible(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.85,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: materials.length,
                              itemBuilder: (BuildContext context, int index) {
                                return MaterialCard(
                                  title: materials[index].name,
                                  image: materials[index].image,
                                  ontap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => ProductScreen(
                                                  id: materials[index].id,
                                                )));
                                  },
                                );
                              },
                            ),
                          ),
                        )
                      : Container(),
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
                    'Logout',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: mainColor,
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async {
                    LoadingHelper.show();
                    await AuthApi.logout();
                    Fluttertoast.showToast(msg: "Logout successfully.");
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                    LoadingHelper.dismiss();
                  },
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
