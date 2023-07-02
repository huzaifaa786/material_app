import 'package:flutter/material.dart';
import 'package:material/api/order.dart';
import 'package:material/screens/home/home.dart';
import 'package:material/static/inputfield.dart';
import 'package:material/values/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  placeOrder() async {
    if (name.text != '' && phone.text != '' && address.text != '') {
    var order =  await OrderApi.placeOrder(name.text, phone.text, address.text);

    if(order != null){
      Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    }
    }else{
      Fluttertoast.showToast(
        msg: "Please fill out all fields",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Out'),
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
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(children: [
                          Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: InputField(
                                hint: 'Name',
                                icon: Icons.people,
                                controller: name,
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: InputField(
                                hint: 'Phone Number',
                                icon: Icons.phone,
                                controller: phone,
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: InputField(
                                hint: 'Address',
                                icon: Icons.map,
                                controller: address,
                              )),
                        ]),
                      )
                    ]),
              ),
              Positioned(
                bottom: 20,
                child: SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    child: Text(
                      'Place Order',
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
                      placeOrder();
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
