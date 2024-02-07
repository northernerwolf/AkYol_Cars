import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmcars_clone/data/providers/getUser_provider.dart';

import 'package:tmcars_clone/presentation/pages/initial/components/cart_main.dart';
import 'package:tmcars_clone/utils/design/app_colors.dart';

import '../../widgets/navigtion_drawer.dart';

class Initial extends StatefulWidget {
  const Initial({super.key});

  @override
  State<Initial> createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  int changer = 0;

  Future<void> checkUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? val = preferences.getString('token');

    if (val != null) {
      await Provider.of<GetUserProvider>(context, listen: false)
          .getUserProvider(context, val);
    }
  }

  List<String> images = [
    'assets/images/cars.jpg',
    'assets/images/parts.jpg',
    'assets/images/home.jpg',
    'assets/images/lost.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerApp(),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(size: 30, color: Colors.white),
        title: const Text(
          'Baş sahypa',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  // splashColor: AppColors.cartColor,
                  // highlightColor: AppColors.cartColor,
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const MusicPlayer()));
                  },
                  child: MainCart(
                    images: images[index],
                  ),
                );
              })),
    );
  }
}
