import 'package:flutter/material.dart';
import 'package:tmcars_clone/presentation/pages/cars/all/all_cars.dart';
import 'package:tmcars_clone/presentation/pages/cars/favorites/favorites.dart';
import 'package:tmcars_clone/presentation/pages/cars/mark/marks.dart';
import 'package:tmcars_clone/presentation/widgets/navigtion_drawer.dart';
import 'package:tmcars_clone/utils/design/app_colors.dart';

class CarsScreen extends StatefulWidget {
  const CarsScreen({super.key});

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerApp(),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(size: 30, color: Colors.white),
        title: const Text(
          'Cars',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        bottom: TabBar(
          indicatorColor: AppColors.primary,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          controller: _tabController,
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 4.0, color: Colors.white),
              insets: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 4.3)),
          tabs: [
            Tab(
              text: 'HEMMESI',
            ),
            Tab(text: 'SAÝLANAN'),
            Tab(text: 'MARKA'),
          ],
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                AllCars(),
                FavoritesCars(),
                CarsMarks(),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
