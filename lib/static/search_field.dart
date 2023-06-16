// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:material/values/colors.dart';

class MSearchBar extends StatelessWidget {
  const MSearchBar(
      {Key? key,
      this.controller,
      this.hint,
      this.text,
      this.icon,
      this.imageIcon,
      this.obscure = false,
      this.toggle,
      this.onChange,
      this.ontap,
      this.type = TextInputType.text,
      this.onpressed})
      : super(key: key);

  final controller;

  final obscure;
  final hint;
  final type;
  final text;
  final icon;
  final ontap;
  final imageIcon;
  final toggle;
  final onChange;
  final onpressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontSize: 14),
      controller: controller,
      onChanged: onChange,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        filled: true,
        fillColor: Colors.white,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[500]),
        contentPadding: const EdgeInsets.only(left: 3.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: mainColor),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: mainColor),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
      ),

      //     (validate == true
      //         ? AutovalidateMode.always
    );
  }
}
