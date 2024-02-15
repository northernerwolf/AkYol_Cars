import 'package:flutter/material.dart';
import 'package:tmcars_clone/presentation/widgets/navigtion_drawer.dart';
import 'package:tmcars_clone/utils/design/app_colors.dart';

class AddsScreen extends StatefulWidget {
  const AddsScreen({super.key});

  @override
  State<AddsScreen> createState() => _AddsScreenState();
}

class _AddsScreenState extends State<AddsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerApp(),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(size: 30, color: Colors.white),
        title: const Text(
          'Bildiriş goşmak',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),
        ),
      ),
    );
  }
}
