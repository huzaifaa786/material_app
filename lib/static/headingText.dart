// ignore_for_file: file_names, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({super.key,this.text});
  final text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle( fontWeight: FontWeight.w600, fontSize: 20),
    );
  }
}
