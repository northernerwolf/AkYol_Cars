import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmcars_clone/data/providers/cars_data_provider.dart';
import 'package:tmcars_clone/presentation/pages/cars/favorites/components/cars_list_cart.dart';
import 'package:tmcars_clone/utils/design/app_colors.dart';

class FavoritesById extends StatefulWidget {
  String id;
  String title;
  FavoritesById({required this.id, required this.title, super.key});

  @override
  State<FavoritesById> createState() => _FavoritesByIdState();
}

class _FavoritesByIdState extends State<FavoritesById> {
  @override
  void initState() {
    fetchData();
    // FirebaseSetup.init(context);
    super.initState();
  }

  fetchData() async {
    await Provider.of<CarsCatigorysByIdProvider>(context, listen: false)
        .getCarsCatigorysByIdProvider(widget.id);
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
          child: Consumer<CarsCatigorysByIdProvider>(builder: (_, models, __) {
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
                    //     builder: (context) => FavoritesById(
                    //           id: models.models[index].id.toString(),
                    //         )));
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
