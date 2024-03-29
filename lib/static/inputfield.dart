// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key, this.controller, this.hint, this.icon, this.onChange});
  final controller;
  final hint;
  final icon;
  final onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey[300]!),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey[300]!),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        //labelText: 'Password',
        hintText: hint,
      ),
    );
  }
}
