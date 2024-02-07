import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmcars_clone/data/providers/cars_catigorys_provider.dart';
import 'package:tmcars_clone/presentation/pages/initial/components/cart_main_network.dart';

class FavoritesCars extends StatefulWidget {
  const FavoritesCars({super.key});

  @override
  State<FavoritesCars> createState() => _FavoritesCarsState();
}

class _FavoritesCarsState extends State<FavoritesCars> {
  @override
  void initState() {
    fetchData();
    // FirebaseSetup.init(context);
    super.initState();
  }

  fetchData() async {
    await Provider.of<CarsCatigorysProvider>(context, listen: false)
        .getCarsCatigorysProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<CarsCatigorysProvider>(builder: (_, models, __) {
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
              child: MainCartNetwork(
                images: '',
                title: models.models[index].name,
              ),
            );
          });
    }));
  }
}
