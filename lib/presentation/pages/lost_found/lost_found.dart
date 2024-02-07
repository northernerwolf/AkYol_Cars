import 'package:flutter/material.dart';
import 'package:tmcars_clone/presentation/widgets/navigtion_drawer.dart';

class Lostfoundscreen extends StatefulWidget {
  const Lostfoundscreen({super.key});

  @override
  State<Lostfoundscreen> createState() => _LostfoundscreenState();
}

class _LostfoundscreenState extends State<Lostfoundscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerApp(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 30,
        ),
        title: const Text(
          'Lost',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
