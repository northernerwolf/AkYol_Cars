import 'package:flutter/material.dart';
import 'package:tmcars_clone/domain/models/cars_byid_model.dart';
import 'package:tmcars_clone/domain/repositories/all_cars_repository.dart';

class AllCarsByIdProvider extends ChangeNotifier {
  final AllCarsByIdRepository useCase = AllCarsByIdRepository();
  bool isLoading = false;
  bool waiting = false;
  VehicleModel? models;
  // String? tokens;
  // List<ErrorModel> errors = [];

  Future<void> getAllCarsByIdProvider(String id) async {
    final result = await useCase.allCarsByIdRepository(id);
    isLoading = true;

    notifyListeners();
    if (result?.statusCode == 200) {
      if (result?.data != null) {
        print(result?.data);
        models = VehicleModel.fromJson(result?.data);
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
