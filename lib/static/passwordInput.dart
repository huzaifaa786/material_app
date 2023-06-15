import 'package:flutter/material.dart';

class PasswordInputField extends StatelessWidget {
  const PasswordInputField(
      {super.key, this.controller, this.hint, this.prefix});
  final controller;
  final hint;
  final prefix;

  @override
  Widget build(BuildContext context) {
    return TextField(
      //obscureText: true,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefix,
          color: Colors.grey,
        ),
        suffixIcon: Icon(
          Icons.remove_red_eye,
          color: Colors.grey,
        ),

        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.grey[200]!),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.grey[200]!),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        //labelText: 'Password',
        hintText: hint,
      ),
    );
  }
}
