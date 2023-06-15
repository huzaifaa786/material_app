// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:material/static/inputfield.dart';
import 'package:material/static/passwordInput.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int index = 0;
  togglefun(state) {
    setState(() {
      index = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/home.jpeg'),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign in to continue',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleSwitch(
                  minWidth: MediaQuery.of(context).size.width * 0.42,
                  minHeight: 60,
                  initialLabelIndex: index,
                  cornerRadius: 10.0,
                  inactiveBgColor: Colors.blue.withOpacity(0.2),
                  totalSwitches: 2,
                  labels: ['Login', 'Register'],
                  activeBgColors: [
                    [Colors.blue],
                    [Colors.blue]
                  ],
                  onToggle: togglefun,
                ),
              ],
            ),
          ),
          index == 0
              ? Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: 20, left: 27, right: 27, bottom: 10),
                        child: InputField(
                          hint: 'Email',
                          icon: Icons.email_sharp,
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20, left: 27, right: 27, bottom: 10),
                      child: PasswordInputField(
                        hint: 'Password',
                        prefix: Icons.lock,
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: SizedBox(
                        height: 45,
                        width: 300,
                        child: ElevatedButton(
                          child: Text(
                            'Sign In',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            backgroundColor: Colors.blue,
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontStyle: FontStyle.normal),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                   Padding(
                        padding: EdgeInsets.only(
                            top: 20, left: 27, right: 27, bottom: 10),
                        child: InputField(
                          hint: 'Name',
                          icon: Icons.person,
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            top: 20, left: 27, right: 27, bottom: 10),
                        child: InputField(
                          hint: 'Email',
                          icon: Icons.email_sharp,
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            top: 20, left: 27, right: 27, bottom: 10),
                        child: PasswordInputField(
                          hint: 'Password',
                          prefix: Icons.lock,
                        )),
                 Padding(
                        padding: EdgeInsets.only(
                            top: 20, left: 27, right: 27, bottom: 10),
                        child: PasswordInputField(
                          hint: 'Conferm Password',
                          prefix: Icons.lock,
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: SizedBox(
                        height: 45,
                        width: 300,
                        child: ElevatedButton(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            backgroundColor: Colors.blue,
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontStyle: FontStyle.normal),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                )
        ],
      )),
    );
  }
}
