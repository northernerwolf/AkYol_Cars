import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmcars_clone/data/providers/cars_moders_provider.dart';
import 'package:tmcars_clone/presentation/pages/cars/mark/components/cars_mark_cart.dart';

class CarsMarks extends StatefulWidget {
  const CarsMarks({super.key});

  @override
  State<CarsMarks> createState() => _CarsMarksState();
}

class _CarsMarksState extends State<CarsMarks> {
  @override
  void initState() {
    fetchData();
    // FirebaseSetup.init(context);
    super.initState();
  }

  fetchData() async {
    await Provider.of<CarsModelsProvider>(context, listen: false)
        .getCarsModelsProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<CarsModelsProvider>(builder: (_, models, __) {
      return ListView.builder(
          itemCount: models.models.length,
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
              child: CarsModelCart(
                image: models.models[index].image,
                titile: models.models[index].name,
                count: models.models[index].count,
              ),
            );
          });
    }));
  }
}
