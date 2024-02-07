import 'package:flutter/material.dart';

class MainCart extends StatelessWidget {
  String images;
  MainCart({required this.images, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  images,
                ),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(0)),
      ),
    );
  }
}
