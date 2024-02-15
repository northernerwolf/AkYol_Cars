import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CarsModelCart extends StatelessWidget {
  String image;
  String titile;
  int count;
  CarsModelCart(
      {required this.image,
      required this.titile,
      required this.count,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
              width: 45,
              height: 45,
              // ignore: unnecessary_null_comparison
              child: image == null
                  ? CachedNetworkImage(imageUrl: image)
                  : Icon(Icons.no_photography)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              titile,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Text('(' + count.toString() + ')')
        ],
      ),
    );
  }
}
