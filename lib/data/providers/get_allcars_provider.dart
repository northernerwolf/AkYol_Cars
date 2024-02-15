import 'package:flutter/material.dart';
import 'package:tmcars_clone/domain/models/cars_get_model.dart';
import 'package:tmcars_clone/domain/repositories/all_cars_repository.dart';

class AllCarsProvider extends ChangeNotifier {
  final AllCarsRepository useCase = AllCarsRepository();
  bool isLoading = false;
  bool waiting = false;
  List<CarItemModel> models = [];
  // String? tokens;
  // List<ErrorModel> errors = [];

  Future<void> getAllCarsProvider() async {
    models = [];
    final result = await useCase.allCarsRepository();
    isLoading = true;

    notifyListeners();
    if (result?.statusCode == 200) {
      if (result?.data != null) {
        print(result?.data);
        models = List<CarItemModel>.from(result?.data['data'].map((e) {
          return CarItemModel.fromJson(e);
        }));
        isLoading = false;
        notifyListeners();
      }
      return;
    }
    if (result?.statusCode == 404) {
      isLoading = false;
      print(result?.data);
      // if (result?.data['errors'] != null) {
      //   errors = List<ErrorModel>.from(result?.data['errors'].map((e) {
      //     return ErrorModel.fromJson(e);
      //   }));
      //   errors.forEach((error) {
      //     var snackBar = SnackBar(
      //         backgroundColor: Colors.red,
      //         content: Text(
      //           error.msg,
      //           style: const TextStyle(color: Colors.white),
      //         ));
      //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //   });
      // } else {
      //   isLoading = false;
      //   var snackBar = SnackBar(
      //       backgroundColor: Colors.red,
      //       content: Text(
      //         result?.data['message'],
      //         style: const TextStyle(color: Colors.white),
      //       ));
      //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // }
    }
  }
}
