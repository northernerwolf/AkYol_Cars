import 'package:flutter/material.dart';
import 'package:tmcars_clone/presentation/widgets/navigtion_drawer.dart';

class HouseScreen extends StatefulWidget {
  const HouseScreen({super.key});

  @override
  State<HouseScreen> createState() => _HouseScreenState();
}

class _HouseScreenState extends State<HouseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerApp(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 30,
        ),
        title: const Text(
          'House',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
