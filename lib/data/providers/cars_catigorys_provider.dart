import 'package:flutter/material.dart';
import 'package:tmcars_clone/domain/models/catigorys_model.dart';
import 'package:tmcars_clone/domain/repositories/cars_models_repository.dart';

class CarsCatigorysProvider extends ChangeNotifier {
  final CarsCatigorysRepository useCase = CarsCatigorysRepository();
  bool isLoading = false;
  bool waiting = false;
  List<CatigoryModel> models = [];
  // String? tokens;
  // List<ErrorModel> errors = [];

  Future<void> getCarsCatigorysProvider() async {
    models = [];
    final result = await useCase.carsCatigorysRepository();
    isLoading = true;

    notifyListeners();
    if (result?.statusCode == 200) {
      if (result?.data != null) {
        print(result?.data);
        models = List<CatigoryModel>.from(result?.data.map((e) {
          return CatigoryModel.fromJson(e);
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
