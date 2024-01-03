import 'package:flutter/material.dart';

class DrawerHeaderScreen extends StatelessWidget {
  const DrawerHeaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.blue,
        width: double.infinity,
        height: 120,
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [],
          ),
        ),
      ),
    );
  }
}
