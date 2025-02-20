import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmcars_clone/data/providers/get_allcars_provider.dart';
import 'package:tmcars_clone/presentation/pages/cars/all/components/all_cars_item.dart';
import 'package:tmcars_clone/presentation/pages/cars/favorites/components/cars_list_cart.dart';

class AllCars extends StatefulWidget {
  const AllCars({super.key});

  @override
  State<AllCars> createState() => _AllCarsState();
}

class _AllCarsState extends State<AllCars> {
  @override
  void initState() {
    fetchData();
    // FirebaseSetup.init(context);
    super.initState();
  }

  fetchData() async {
    await Provider.of<AllCarsProvider>(context, listen: false)
        .getAllCarsProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Consumer<AllCarsProvider>(builder: (_, models, __) {
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AllCarsById(
                              id: models.models[index].id.toString(),
                              title: models.models[index].model.name,
                            )));
                  },
                  child: CarsListCart(
                    location: models.models[index].location.name,
                    titile: models.models[index].model.name,
                    time: models.models[index].time,
                    price: models.models[index].price.toString(),
                    obmen: models.models[index].change,
                    kredit: models.models[index].credit,
                  ));
            });
      })),
    );
  }
}
