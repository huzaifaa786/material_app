// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class PasswordInputField extends StatelessWidget {
  const PasswordInputField({
    super.key,
    this.controller,
    this.hint,
    this.prefix,
    this.obscure = true,
    this.toggle,
  });
  final controller;
  final hint;
  final prefix;
  final obscure;
  final toggle;

  @override
  Widget build(BuildContext context) {
    return TextField(
      //obscureText: true,
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefix,
          color: Colors.grey,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            toggle();
          },
          child: obscure == false
              ? Icon(
                  Icons.visibility_off_outlined,
                  color: Colors.grey,
                )
              : Icon(
                  Icons.visibility_outlined,
                  color: Colors.grey,
                ),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey[300]!),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey[300]!),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        hintText: hint,
      ),
    );
  }
}
