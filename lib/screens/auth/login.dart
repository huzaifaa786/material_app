// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:material/api/auth.dart';
import 'package:material/screens/home/home.dart';
import 'package:material/static/inputfield.dart';
import 'package:material/static/password_input.dart';
import 'package:material/values/colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int index = 0;
  bool _obscureText = true;
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  bool emailValid = false;

  onEmailChanged(value) {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      setState(() {
        emailValid = true;
      });
    } else {
      setState(() {
        emailValid = false;
      });
    }
  }

  login() async {
    if (emailController.text == '' || passwordController.text == '') {
      Fluttertoast.showToast(msg: 'Fill out all the Fields. Invalid!');
    } else {
      if (await AuthApi.login(
        emailController.text.toString(),
        passwordController.text.toString(),
      )) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    }
  }

  register() async {
    if (emailValid) {
      if (name.text == '' ||
          email.text == '' ||
          password.text == '' ||
          cpassword.text == '') {
        Fluttertoast.showToast(msg: 'Fill out all the Fields. Invalid!');
      } else {
        if (password.text != cpassword.text) {
          Fluttertoast.showToast(
              msg: 'Password and Confirm Password field are not same');
        } else {
          if (await AuthApi.register(name.text.toString(),
              email.text.toString(), password.text.toString())) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          } else {
            Fluttertoast.showToast(msg: 'Error!');
          }
        }
      }
    } else {
      Fluttertoast.showToast(msg: 'Invalid! Email Format.');
    }
  }

  togglefun(state) {
    setState(() {
      index = state;
    });
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  void _toggle2() {
    setState(() {
      _obscureText2 = !_obscureText2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                      inactiveBgColor: mainColor.withOpacity(0.2),
                      totalSwitches: 2,
                      labels: ['Login', 'Register'],
                      activeBgColors: [
                        [mainColor],
                        [mainColor]
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
                            padding: EdgeInsets.only(top: 20),
                            child: InputField(
                              hint: 'Email',
                              icon: Icons.email_sharp,
                              controller: emailController,
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: PasswordInputField(
                              hint: 'Password',
                              prefix: Icons.lock,
                              obscure: _obscureText,
                              toggle: _toggle,
                              controller: passwordController,
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: SizedBox(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              child: Text(
                                'Sign In',
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
                              onPressed: () {
                                login();
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: InputField(
                              hint: 'Name',
                              icon: Icons.person,
                              controller: name,
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: InputField(
                              hint: 'Email',
                              icon: Icons.email_sharp,
                              controller: email,
                              onChange: onEmailChanged,
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: PasswordInputField(
                              hint: 'Password',
                              prefix: Icons.lock,
                              obscure: _obscureText1,
                              toggle: _toggle1,
                              controller: password,
                            )),
                        Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: PasswordInputField(
                              hint: 'Confirm Password',
                              prefix: Icons.lock,
                              obscure: _obscureText2,
                              toggle: _toggle2,
                              controller: cpassword,
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: SizedBox(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              child: Text(
                                'Sign Up',
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
                              onPressed: () {
                                register();
                              },
                            ),
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
      )),
    );
  }
}
