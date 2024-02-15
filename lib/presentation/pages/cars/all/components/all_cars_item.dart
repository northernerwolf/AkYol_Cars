import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmcars_clone/data/providers/all_carbyid_provider.dart';
import 'package:tmcars_clone/utils/design/app_colors.dart';

// ignore: must_be_immutable
class AllCarsById extends StatefulWidget {
  String id;
  String title;
  AllCarsById({required this.id, required this.title, super.key});

  @override
  State<AllCarsById> createState() => _AllCarsByIdState();
}

class _AllCarsByIdState extends State<AllCarsById> {
  void initState() {
    fetchData();

    super.initState();
  }

  fetchData() async {
    await Provider.of<AllCarsByIdProvider>(context, listen: false)
        .getAllCarsByIdProvider(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(size: 30, color: Colors.white),
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
          child: Consumer<AllCarsByIdProvider>(builder: (_, models, __) {
        return Column(
          children: [
            Text(models.models?.description ?? ''),
          ],
        );
      })),
    );
  }
}
