import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmcars_clone/domain/models/error.dart';
import 'package:tmcars_clone/domain/repositories/login_repository.dart';
import 'package:tmcars_clone/presentation/pages/initial/initial.dart';

class LoginProvider extends ChangeNotifier {
  final LoginRepository useCase = LoginRepository();
  bool isLoading = false;
  bool waiting = false;
  String? tokens;
  List<ErrorModel> errors = [];

  Future<void> postDataProvider(
    BuildContext context,
    String phone,
    String password,
  ) async {
    final result = await useCase.loginRepository(
      context,
      phone,
      password,
    );
    isLoading = true;

    notifyListeners();
    if (result?.statusCode == 200) {
      if (result?.data != null) {
        print(result?.data);
        isLoading = false;
        notifyListeners();
        SharedPreferences preferences = await SharedPreferences.getInstance();

        tokens = result?.data['token'];
        await preferences.setString('token', tokens!);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const Initial()),
            (route) => false);
      }
      return;
    }
    if (result?.statusCode == 404) {
      isLoading = false;
      print(result?.data);
      if (result?.data['errors'] != null) {
        errors = List<ErrorModel>.from(result?.data['errors'].map((e) {
          return ErrorModel.fromJson(e);
        }));
        errors.forEach((error) {
          var snackBar = SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                error.msg,
                style: const TextStyle(color: Colors.white),
              ));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      } else {
        isLoading = false;
        var snackBar = SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              result?.data['message'],
              style: const TextStyle(color: Colors.white),
            ));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}
