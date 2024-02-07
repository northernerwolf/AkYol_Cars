import 'package:flutter/material.dart';
import 'package:tmcars_clone/domain/models/error.dart';
import 'package:tmcars_clone/domain/repositories/user_repository.dart';

class GetUserProvider extends ChangeNotifier {
  final UserRepository useCase = UserRepository();
  bool isLoading = false;
  bool waiting = false;
  String? tokens;
  List<ErrorModel> errors = [];

  Future<void> getUserProvider(
    BuildContext context,
    String token,
  ) async {
    final result = await useCase.userRepository(
      context,
      token,
    );
    isLoading = true;

    notifyListeners();
    if (result?.statusCode == 200) {
      if (result?.data != null) {
        print(result?.data);
        isLoading = false;
        notifyListeners();
      }
      return;
    } else {
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
