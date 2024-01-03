import 'package:flutter/material.dart';

import '../../widgets/navigtion_drawer.dart';

class Initial extends StatefulWidget {
  const Initial({super.key});

  @override
  State<Initial> createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerApp(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          size: 30,
        ),
        title: Text(
          'Baş sahypa',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [Text('data')],
      )),
    );
  }
}
