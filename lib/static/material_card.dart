// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class MaterialCard extends StatelessWidget {
  const MaterialCard({super.key, this.image, this.title, this.ontap});
  final image;
  final title;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  image != ''
                      ? CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(image),
                        )
                      : CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/300px-No_image_available.svg.png'),
                          foregroundImage: NetworkImage(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/300px-No_image_available.svg.png'),
                        ),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
              Icon(Icons.arrow_circle_right_outlined)
            ],
          ),
        ),
      ),
    );
  }
}
