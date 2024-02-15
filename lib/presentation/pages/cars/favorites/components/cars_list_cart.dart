import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CarsListCart extends StatelessWidget {
  String titile;
  String location;
  String time;
  String price;
  bool obmen;
  bool kredit;
  CarsListCart({
    required this.titile,
    required this.location,
    required this.time,
    required this.price,
    required this.obmen,
    required this.kredit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 100,
            child: CachedNetworkImage(imageUrl: ''),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titile,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      location,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(
                        time,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Obmen',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        obmen == false
                            ? Icon(
                                Icons.close,
                                size: 16,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.check_sharp,
                                size: 16,
                                color: Colors.green,
                              )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        children: [
                          Text(
                            'Kredit',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          obmen == false
                              ? Icon(
                                  Icons.close,
                                  size: 16,
                                  color: Colors.red,
                                )
                              : Icon(
                                  Icons.check_sharp,
                                  size: 16,
                                  color: Colors.green,
                                )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
