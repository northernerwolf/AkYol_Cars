import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmcars_clone/utils/design/app_colors.dart';

class MainCartNetwork extends StatelessWidget {
  String images;
  String title;
  MainCartNetwork({required this.images, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
            child: CachedNetworkImage(
              imageUrl: images,
            ),
          ),
          Center(
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'GÖRKEZ HEMMESINI (123)',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
