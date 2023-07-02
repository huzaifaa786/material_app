import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material/api/auth.dart';
import 'package:material/api/material.dart';
import 'package:material/helpers/loading.dart';
import 'package:material/model/vendor.dart';
import 'package:material/screens/auth/login.dart';
import 'package:material/screens/order_history/order_history.dart';
import 'package:material/screens/product/products.dart';
import 'package:material/static/material_card.dart';
import 'package:material/values/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  List<VendorModel> materials = [];
  getmaterials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('carts');
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
      drawer: Drawer(
        child: ListTileTheme(
            child: ListView(
          children: [
            ListTile(
              leading: Icon(
                Icons.trolley,
                color: mainColor,
              ),
              title: Text(
                "Orders",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: ListTileTheme.of(context).textColor,
                    ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OrderHistoryScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.map,
                color: mainColor,
              ),
              title: Text(
                "Vendors Map",
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: ListTileTheme.of(context).textColor,
                    ),
              ),
              onTap: () {},
            ),
          ],
        )),
      ),
      appBar: AppBar(
        title: Text('Building Material'),
        backgroundColor: mainColor,
        centerTitle: true,
        actions: <Widget>[
          InkWell(
            onTap: () async {
              LoadingHelper.show();
              await AuthApi.logout();
              Fluttertoast.showToast(msg: "Logout successfully.");
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen()));
              LoadingHelper.dismiss();
            },
            child: Stack(
              children: <Widget>[
                new IconButton(
                  icon: new Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onPressed: null,
                ),
              ],
            ),
          ),
        ],
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
                      'Choose Vendor: ',
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
                                return VendorCard(
                                  title: materials[index].name,
                                  address: materials[index].address,
                                  ontap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => ProductScreen(
                                                  id: materials[index].id,
                                                  vendor: materials[index],
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
          ],
        ),
      )),
    );
  }
}
