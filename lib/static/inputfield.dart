import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, this.controller, this.hint, this.icon});
  final controller;
  final hint;
  final icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.grey[200]!),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 3, color: Colors.grey[200]!),
        ),
        //labelText: 'Password',
        hintText: hint,
      ),
    );
  }
}
